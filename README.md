# 📄 PDF Normalizer 4780KB

![PowerShell](https://img.shields.io/badge/PowerShell-Automation-blue)
![Ghostscript](https://img.shields.io/badge/Ghostscript-PDF%20Processing-red)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)

Automação em **PowerShell** para normalização de arquivos PDF, garantindo que cada documento final tenha tamanho máximo de **4780 KB**.

O script realiza compressão automática e, quando necessário, divide o documento em múltiplos arquivos agrupando páginas inteligentemente para respeitar o limite de tamanho.

Ideal para sistemas que possuem **restrição de upload por tamanho de arquivo**.

---

# 🚀 Funcionalidades

✔ Processamento automático de PDFs em lote  
✔ Compressão automática utilizando **Ghostscript**  
✔ Divisão inteligente baseada no tamanho do arquivo  
✔ Agrupamento de páginas para otimizar quantidade de arquivos gerados  
✔ Remoção automática de arquivos temporários  
✔ Preparação de documentos para upload em sistemas com limite de tamanho  

---

# ⚙️ Tecnologias Utilizadas

- **PowerShell**
- **Ghostscript**

---

# 📦 Estrutura do Projeto
1️⃣ Identifica PDFs na pasta
2️⃣ Verifica tamanho do arquivo
3️⃣ Se ≤ 4780 KB → mantém
4️⃣ Se > 4780 KB → aplica compressão
5️⃣ Se ainda > 4780 KB → divide o documento
6️⃣ Agrupa páginas até gerar arquivos ≤ 4780 KB
