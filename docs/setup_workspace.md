# 🛠️ Setup remoto de entorno FindMyStyle en WSL + Docker + dispositivo (por Juanma Canals)

Este documento explica paso a paso cómo he montado un entorno de desarrollo remoto para el proyecto **FindMyStyle**, utilizando mi **PC personal con Windows 10 + WSL2 + Docker**, accediendo y trabajando cómodamente **desde mi dispositivo**, como si el PC fuera un servidor local de IA.

---

## 🧠 Objetivo

Tener un entorno reproducible y profesional donde todo el procesamiento pesado (scraping, Whisper, análisis textual, dashboards...) se ejecuta en mi PC, y yo interactúo desde el dispositivo por SSH o Visual Studio Code.

---

## 💻 Arquitectura usada

* **PC con Windows 10 + WSL2 (Ubuntu 22.04)**
* **Docker Desktop con integración WSL habilitada**
* Acceso remoto SSH desde mi dispositivo
* Configuración de red para exponer correctamente puertos (22, 8501...)

---

## 🧱 Pasos seguidos

### 1. Instalación del entorno base en el PC

* Instalé WSL2 y configuré Ubuntu 22.04 como distro principal
* Instalé Docker Desktop y habilité la integración con WSL (esto permite usar Docker dentro de Ubuntu)

### 2. Corrección del error inicial al ejecutar Docker en WSL

Al principio, al hacer `docker run` dentro de WSL, me salía este error:

```
The command 'docker' could not be found in this WSL 2 distro.
```

🔧 Solución: abrir Docker Desktop > Settings > Resources > WSL Integration → Activar para Ubuntu

---

### 3. Clonación del proyecto y preparación del entorno

* Cloné el repo desde GitHub vía SSH dentro de WSL:

```bash
git clone git@github.com:juanmacanals/findmystyle.git
```

* Confirmé que `docker version` funcionaba correctamente

---

### 4. Problemas al hacer `docker build`

Me encontré con este error al intentar hacer `make build`:

```
tls: failed to verify certificate: x509: certificate signed by unknown authority
```

🔧 Solución: fue necesario reiniciar Docker Desktop y asegurar que la VM tenía acceso a la red correctamente. Una vez Docker estaba bien enlazado con WSL, el problema se resolvió solo.

---

### 5. Configuración del servidor SSH en WSL

WSL no expone puertos al exterior por defecto, así que tuve que:

* Instalar el servidor SSH:

```bash
sudo apt update && sudo apt install openssh-server -y
```

* Configurar `/etc/ssh/sshd_config` para permitir conexiones externas de forma segura:

  * `ListenAddress 0.0.0.0`
  * `Port 22`
  * `PermitRootLogin no`
  * `PasswordAuthentication no` (solo acceso por clave SSH)

⚠️ **Importante:** permitir conexiones desde `0.0.0.0` abre el acceso a todo tu entorno, por lo que es altamente recomendable:

* Usar sólo autenticación por clave SSH (ya activado)

* Configurar un firewall que limite accesos sólo desde tu IP (Mac)

* No exponer el puerto 22 a internet si estás en red pública

* Iniciar el servicio:

```bash
sudo service ssh start
```

* Verificar que estaba escuchando:

```bash
sudo netstat -tulnp | grep :22
```

---

### 🔐 Intercambio seguro de claves SSH

* Generé una clave SSH en mi dispositivo con:

```bash
ssh-keygen -t ed25519 -C "juanma@dispositivo"
```

* Copié la clave pública al servidor WSL con:

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub juanma@192.168.1.42
```

* Verifiqué que el acceso desde el dispositivo funciona sin contraseña
* Confirmé que ahora **solo se puede acceder por clave SSH**, aumentando la seguridad

---

### 6. Problemas de conexión desde mi dispositivo

Pese a que el puerto respondía al ping, el SSH se quedaba colgado.

🔧 Solución definitiva: configurar **port forwarding desde Windows al entorno WSL** usando:

```powershell
netsh interface portproxy add v4tov4 listenport=22 listenaddress=0.0.0.0 connectport=22 connectaddress=172.X.X.X
```

> (La IP `172.X.X.X` la obtuve ejecutando `ip addr` dentro de Ubuntu y localizando la IP de WSL)

También abrí manualmente el puerto 22 en el Firewall de Windows.

---

### 7. Acceso desde mi dispositivo por SSH

Una vez configurado todo lo anterior, desde mi dispositivo:

```bash
ssh juanma@192.168.1.42
```

Y funcionó correctamente. Ahora puedo trabajar desde VSCode en modo remoto, lanzar notebooks, comandos, etc.

---

## ✨ Resultado

Ya tengo un entorno **totalmente funcional**, donde todo el procesamiento de IA y automatización se hace en mi PC personal (con WSL + Docker), y yo puedo trabajar desde mi dispositivo sin instalar nada localmente.

Este es el entorno donde desarrollaré todas las funcionalidades de **FindMyStyle**: scraping, análisis de estilo, generación de guiones y dashboards.

---

## 💡 Lecciones aprendidas

* Trabajar con WSL y exponer servicios requiere comprender bien redes locales y forwarding de puertos
* Tener control del entorno (sin depender de Colab o servidores externos) es clave para un proyecto modular y reproducible
* Documentar cada paso ayuda a mostrar solvencia técnica y capacidad de resolución real
* ⚠️ Seguridad: ya está activado el acceso **exclusivo por clave SSH**, pero si se expusiera este entorno a internet se deberían reforzar aún más las medidas (firewalls, VPN, detección de fuerza bruta)

---

