# 📄 PowerShell - Normalização e Compressão de PDFs (máximo 5MB) [pode alterar o tamanho no script]

Script em **PowerShell** desenvolvido para **normalizar, dividir e reduzir o tamanho de arquivos PDF automaticamente**, garantindo que cada arquivo final tenha **no máximo 5MB**.

Este projeto é útil para cenários onde sistemas possuem **limite de upload de arquivos**, exigindo que documentos sejam ajustados antes do envio.

---

# 🚀 Funcionalidades

✔ Compressão automática de arquivos PDF
✔ Divisão de arquivos maiores que 5MB
✔ Processamento em lote
✔ Padronização de documentos
✔ Automação de fluxo de arquivos

---

# ⚙️ Tecnologias utilizadas

* PowerShell
* Ghostscript
* Automação de arquivos
* Processamento em lote de PDFs

---

# 📥 Instalação

## 1️⃣ Instalar o Ghostscript

O script utiliza o **Ghostscript** para realizar a compressão dos PDFs.

Download:

https://www.ghostscript.com/download.html

Após instalar, verifique se o executável `gswin64c.exe` está disponível no sistema.

---

## 2️⃣ Clonar o repositório

```bash
git clone https://github.com/LucasLimaFreireBrito/PowerShell_PDF_Normalizado_Menor_5mb.git
```

Entrar na pasta do projeto:

```bash
cd PowerShell_PDF_Normalizado_Menor_5mb
```

---

# ▶️ Como usar

1. Coloque os arquivos PDF que deseja processar na pasta de entrada.

Exemplo:

```
input/
contrato.pdf
documento.pdf
arquivo_grande.pdf
```

2. Execute o script PowerShell:

```powershell
.\compress_pdf.ps1
```

3. Os arquivos processados serão gerados automaticamente na pasta de saída.

```
output/
contrato.pdf
documento.pdf
arquivo_grande_parte1.pdf
arquivo_grande_parte2.pdf
```

Todos os arquivos gerados terão **tamanho máximo de 5MB**.

---

# 🧠 Como o script funciona

O processo executa as seguintes etapas:

1. Analisa os arquivos PDF presentes na pasta de entrada
2. Verifica o tamanho de cada arquivo
3. Aplica compressão utilizando Ghostscript
4. Caso necessário, divide arquivos grandes
5. Garante que cada arquivo final tenha até **5MB**
6. Salva os arquivos processados na pasta de saída

---

# 📁 Estrutura do projeto

```
PowerShell_PDF_Normalizado_Menor_5mb
│
├── compress_pdf.ps1
├── input/
├── output/
└── README.md
```

---

# 📌 Possíveis usos

Este script pode ser utilizado em diversos cenários:

* envio de documentos para sistemas com limite de upload
* automação de processamento de PDFs
* preparação de documentos fiscais ou administrativos
* integração com pipelines automatizados
* processamento em lote de arquivos

---

# 🔧 Melhorias futuras

* interface de linha de comando com parâmetros
* logs detalhados de processamento
* suporte a outros limites de tamanho
* paralelização do processamento
* integração com automações corporativas

---

# 📜 Licença

Este projeto está sob a licença **MIT**.

---

# 👨‍💻 Autor

**Lucas Lima Freire Brito**

GitHub:
https://github.com/LucasLimaFreireBrito

---

# ⭐ Contribuição

Sinta-se à vontade para abrir **issues**, sugerir melhorias ou enviar **pull requests**.
