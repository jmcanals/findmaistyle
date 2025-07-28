# Nombre de la imagen
IMAGE_NAME = findmystyle

# Puerto del dashboard (Streamlit o similar)
PORT = 8501

# Ruta del proyecto en tu máquina
WORKDIR = $(shell pwd)

# Etiqueta :Z para SELinux si usas Fedora/RedHat
VOLUME_FLAGS = -v $(WORKDIR):/app:Z

# --- Comandos ---

build:
	podman build -t $(IMAGE_NAME) .

run:
	podman run -it $(VOLUME_FLAGS) -p $(PORT):$(PORT) $(IMAGE_NAME)

shell:
	podman run -it $(VOLUME_FLAGS) --entrypoint /bin/bash $(IMAGE_NAME)

rebuild:
	podman build --no-cache -t $(IMAGE_NAME) .

clean:
	podman rmi $(IMAGE_NAME) || true

build-noverify:
	podman build --tls-verify=false -t $(IMAGE_NAME) .


