# 🎬 ReelGenius

**ReelGenius** es un sistema inteligente de análisis y generación de guiones virales, diseñado para ayudarte a entender por qué ciertos Reels funcionan y cómo puedes replicar su éxito con tu propio estilo. Utiliza tecnologías de inteligencia artificial, embeddings semánticos y agentes inteligentes para automatizar el análisis, la adaptación y la generación de guiones personalizados.

---

## 🧠 ¿Qué hace ReelGenius?

- 🔍 **Scrapea Reels virales** de cuentas seleccionadas.
- 📝 **Transcribe y analiza los guiones** usando modelos de lenguaje.
- 🧩 **Extrae patrones narrativos, emocionales y estructurales.**
- 🧠 **Cruza esos patrones con tus propios textos** y estilo.
- ✍️ **Genera nuevos guiones adaptados a ti** que replican fórmulas virales.
- 📊 **Visualiza todo el análisis** en un dashboard interactivo.
- ⚙️ **Todo orquestado automáticamente**, modular y open-source.

---

## 🧩 Arquitectura del proyecto
```plaintext
📦 ReelGenius/
├── src/
│ ├── scraper/ # Descarga y parsing de Reels
│ ├── transcriber/ # Transcripción automática con Whisper
│ ├── embeddings/ # Vectorización semántica
│ ├── analyzer/ # Análisis emocional y narrativo
│ ├── retriever/ # Recuperación semántica de textos personales
│ ├── generator/ # Generación de nuevos guiones
│ ├── orchestrator/ # Automatización y flujo de tareas
│ ├── api/ # API con FastAPI
│ └── dashboard/ # Visualización en Streamlit
├── data/
│ ├── raw/ # Datos sin procesar
│ └── processed/ # Guiones limpios, vectores, etiquetas
├── notebooks/ # Experimentos y pruebas interactivas
├── docs/
│ └── plan_de_implementacion.md
├── README.md
└── requirements.txt

```
---
## 🚀 Tecnologías clave

- 🧠 `LangChain`, `LLamaIndex`, `CrewAI` para agentes y flujos dinámicos
- 🔊 `Whisper` de OpenAI para transcripción automática
- 🧮 `FAISS` o `Chroma` para vector search
- 💬 `Transformers` de HuggingFace para análisis lingüístico profundo
- ⚙️ `FastAPI` para APIs
- 📊 `Streamlit` para dashboard interactivo
- 🐳 `Docker`, `Makefile`, `GitHub Actions` para integración y despliegue

---

## 🗓 Plan de trabajo

Este proyecto sigue un plan de implementación detallado dividido por semanas.  
Consulta el archivo completo aquí:  
📄 [`docs/plan_de_implementacion.md`](docs/plan_de_implementacion.md)

---

## ✅ Estado actual

- [x] Estructura del proyecto creada
- [x] Carpeta modular con notebooks y datos
- [ ] Scrapear reels + transcribir automáticamente
- [ ] Análisis de estructura, emoción y estilo
- [ ] Generación de guiones nuevos personalizados
- [ ] Dashboard para visualizar métricas y resultados
---

## ✨ Contribuciones

Este proyecto es open-source.  
Si quieres contribuir o adaptarlo a otros formatos (YouTube Shorts, TikTok, newsletters...), ¡bienvenido/a!

---
## 👨‍💻 Autor

**Juanma Canals**  
📧 jmcanals98@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/juan-manuel-canals/)

---
