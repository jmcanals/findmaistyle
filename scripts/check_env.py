# check_env.py

import sys

def check_package(pkg_name, attr="__version__"):
    try:
        pkg = __import__(pkg_name)
        version = getattr(pkg, attr, "Version info no disponible")
        print(f"{pkg_name} importado correctamente. Versión: {version}")
    except ImportError:
        print(f"Error: no se pudo importar {pkg_name}")

def main():
    print("Validando entorno FindMyStyle...\n")
    paquetes = ["spacy", "pandas", "transformers", "streamlit", "whisper"]
    for pkg in paquetes:
        check_package(pkg)

    print("\nValidación finalizada. Si no hay errores, el entorno está listo.")

if __name__ == "__main__":
    main()
