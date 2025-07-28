# ⚙️ Configuración de entorno con Poetry y pyproject.toml

Este proyecto usa [`Poetry`](https://python-poetry.org/) para gestionar dependencias, entornos virtuales y configuración del proyecto de forma reproducible. A continuación explico cómo generé el archivo `pyproject.toml` y los problemas que encontré al instalar las dependencias, con sus soluciones.

---

## 🧪 1. Generación del `pyproject.toml`

Inicialicé el entorno ejecutando:

```bash
poetry init
```
Después edité el archivo pyproject.toml para incluir todas las dependencias clave del proyecto FindMyStyle, que son necesarias para scraping, análisis lingüístico, transcripción con IA y visualización interactiva:
```
[tool.poetry]
name = "findmaistyle"
version = "0.1.0"
description = "Análisis y generación de estilo narrativo con IA"
authors = ["Juanma Canals <jmcanals98@gmail.com>"]
readme = "README.md"
packages = [{ include = "findmaistyle" }]

[tool.poetry.dependencies]
python = "^3.10"
notebook = "^7.4.4"
pandas = "^2.3.1"
textstat = "^0.7.8"
openai = "^1.97.1"
spacy = "^3.8.7"
transformers = "^4.54.0"
streamlit = "^1.47.1"

[build-system]
requires = ["poetry-core>=2.0.0"]
build-backend = "poetry.core.masonry.api"
```

## ✅ 2. Validaciones después de configurar el entorno

Después de guardar el pyproject.toml, ejecuté:
```
poetry install
```

Y verifiqué que:
- El entorno virtual se activara correctamente (poetry shell)
- Todos los paquetes se instalaran sin errores
- El módulo principal findmaistyle/ tuviera al menos un __init__.py para que poetry lo reconociera 

## 3. Problemas encontrados y cómo los resolví
- 🧩 Error: mezcla de [project] y [tool.poetry]
Inicialmente usé el formato [project], pero Poetry solo soporta [tool.poetry]. Solución:

- ✅ Eliminar [project] y mover todo a [tool.poetry] con el formato correcto.

- 🚫 Error: requires-python no permitido
Puse requires-python = "...“ dentro de [tool.poetry], lo cual no es válido. Solución:

✅ Usar directamente:
```
python = "^3.10"
```
dentro de [tool.poetry.dependencies].

- 🧱 Error: findmaistyle no contiene elementos
Poetry daba este warning al instalar el proyecto:
```
/home/juanma/findmaistyle/findmaistyle does not contain any element
```
Solución:

✅ Crear un archivo findmaistyle/__init__.py y módulos vacíos como pipeline.py, analysis.py, etc.

- 🧨 Error crítico: fallo al instalar tokenizers
Este fue el error más complejo:

Unable to find installation candidates for tokenizers (0.21.4)
Esto ocurre porque algunos wheels de tokenizers no están disponibles para ciertas arquitecturas o versiones de Python, y requiere compilar desde código fuente. Solución:

✅ Entrar al entorno virtual con:
```
poetry shell
```
✅ Instalar manualmente:
```
pip install tokenizers==0.21.4
```
Si eso no funciona, instalar herramientas de compilación:
```
sudo apt install build-essential python3-dev rustc cargo
```
🎯 Conclusión

Este proceso me sirvió para dejar el entorno de desarrollo completamente funcional, con dependencias modernas y compatibles entre sí, y además ganar experiencia real resolviendo conflictos típicos de dependencias complejas como transformers y whisper.

🧠 Recomendación

Si vas a clonar este proyecto o reproducirlo desde cero, asegúrate de tener:

- Python 3.10 instalado
- Poetry configurado
- Compiladores (build-essential, rustc) disponibles
- El entorno activado antes de instalar con pip
Y ejecuta:
```
poetry install
```
para dejar todo listo.
