# 🎯 FindMyStyle — IA para encontrar y replicar tu voz creativa

**FindMyStyle** es una plataforma modular de automatización con inteligencia artificial que analiza el contenido de creadores referentes, extrae su estilo narrativo y lo adapta a tu propia voz.

¿Para qué?  
Para entender por qué ciertos contenidos funcionan, **aprender de forma automatizada** y generar guiones que conectan de forma más efectiva con tu audiencia… sin perder tu autenticidad.

Este proyecto representa una transición profesional real: de Service Manager en automatización bancaria a experto en IA aplicada a automatización de contenidos.

---

## 🧠 ¿Qué hace FindMyStyle?

- 🔍 **Scrapea Reels virales** de cuentas seleccionadas automáticamente  
- 🔊 **Transcribe los audios** con Whisper para extraer los guiones  
- 🧠 **Analiza la estructura narrativa, emocional y retórica** con modelos LLM  
- 🧩 **Extrae patrones de estilo** (hooks, metáforas, ritmo, tono...)  
- 🧬 **Cruza estos patrones con tus propios textos**  
- ✍️ **Genera guiones nuevos adaptados a ti**  
- 🦾 **Orquesta todo el proceso con agentes inteligentes y automatización modular**  
- 📊 **Visualiza los insights** en dashboards interactivos  

[🎬 Reels virales] 
    ↓
[🧠 Transcripción y análisis con IA]
    ↓
[📊 Dataset de patrones narrativos]
    ↓
[🧬 Comparación con tus textos]
    ↓
[✍️ Generación de guiones adaptados]
    ↓
[📈 Visualización + Automatización]

---

## 🧩 Arquitectura del proyecto
```plaintext
findmaistyle/
├── src/
│ ├── scraper/ # Scraping de Reels y metadatos
│ ├── transcriber/ # Transcripción con Whisper
│ ├── analyzer/ # Análisis narrativo y estilístico
│ ├── embeddings/ # Vectorización semántica
│ ├── retriever/ # Recuperación y comparación de textos propios
│ ├── generator/ # Generación de nuevos guiones
│ ├── orchestrator/ # Automatización de tareas y flujos (agentes, n8n)
│ ├── api/ # API modular con FastAPI
│ └── dashboard/ # Visualización con Streamlit
├── data/
│ ├── raw/ # Reels sin procesar
│ └── processed/ # Guiones limpios y vectorizados
├── notebooks/ # Experimentos y pruebas interactivas
├── docs/ # Documentación técnica y plan de trabajo
│ └── plan_de_implementacion.md
├── README.md
└── requirements.txt

```
---
## ⚙️ Tecnologías clave

### 🔧 Automatización e infraestructura

- 🟩 `n8n` para automatización visual e integración entre servicios  
- ⚙️ `LangChain`, `LLamaIndex`, `CrewAI` para agentes inteligentes y flujos dinámicos  
- 🐳 `Docker`, `Makefile`, `GitHub Actions` para CI/CD y portabilidad  

### 🧠 Procesamiento de lenguaje y análisis

- 🔊 `Whisper` de OpenAI para transcripción  
- 📚 `Transformers` (HuggingFace) para análisis semántico  
- 📈 `textstat`, `spaCy`, `lexical-diversity` para métricas estilísticas  
- 🔍 `FAISS` o `Chroma` para búsquedas vectoriales  

### 🛠️ Backend y visualización

- ⚡ `FastAPI` como backend API  
- 📊 `Streamlit` para dashboards  
- 🐍 `Pandas` y `Plotly` para análisis y gráficas  

---

## 🔄 Plan de trabajo (en desarrollo)

Consulta el plan detallado por semanas aquí:  
📄 [`docs/plan_de_implementacion.md`](docs/plan_de_implementacion.md)

Avance actual:

- [x] Estructura inicial del proyecto  
- [x] Integración básica de notebooks y flujo modular  
- [ ] Scraping + Transcripción automatizados  
- [ ] Análisis profundo de estilo y emociones  
- [ ] Generación de guiones adaptados  
- [ ] Dashboards para visualización de insights  
- [ ] Automatización orquestada con agentes y/o n8n  

---

## 🚀 Visión a medio plazo

- Convertir este proyecto en una **plantilla open-source reutilizable** para analizar y generar contenido adaptado al estilo de cualquier marca o creador  
- Explorar su uso en YouTube Shorts, TikTok, newsletters o incluso libros  
- Construir un **caso de uso sólido para transición profesional** hacia perfiles de IA aplicada a automatización y contenido  

---

## ✨ Contribuciones

Este proyecto es open-source.  
Si quieres adaptarlo a tu propio caso o contribuir con módulos nuevos (como clasificación de tono, análisis de marca personal, etc.), ¡adelante!

---
## 👨‍💻 Autor

**Juanma Canals**  
📧 jmcanals98@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/juan-manuel-canals/)

---
