# Detalhes da Implementação & Como Executar

## Escolha do Teste & Diferenciais
* **Opção Escolhida:** Opção A.
* **Diferencial Implementado:** Criado um botão de **Play/Pause** para controle da animação.

---

## Observação Importante sobre o CORS
Ao tentar abrir diretamente o arquivo `index.html` no navegador, é provável que ocorra um erro de **CORS (Cross-Origin Resource Sharing)**.

> **Por que isso acontece?**  
> Por padrão, navegadores como **Chrome** e **Firefox** bloqueiam a requisição de recursos locais (como imagens e assets) via protocolo `file://` por razões de segurança.

---

## Como Executar o Projeto

Escolha uma das opções abaixo para rodar o projeto localmente:

###  Opção A: Servidor Local via Python

1. **Abra o terminal na pasta do projeto:**
   * Navegue até a pasta onde está o arquivo `index.html`.
   * Clique com o **botão direito** em um espaço vazio da pasta e selecione **"Abrir no Terminal"** (ou *Open in Terminal*).

2. **Inicie o servidor HTTP:**
   * **macOS / Linux:**
     ```bash
     python3 -m http.server 8000
     ```
   * **Windows:**
     ```cmd
     python -m http.server 8000
     ```

3. **Acesse no navegador:**
   * Abra o navegador e acesse: [http://localhost:8000](http://localhost:8000)

---

###  Opção B: Via Haxe / Lime (HTML5)

1. **Abra o terminal na pasta do projeto:**
   * Navegue até a pasta `pack-teste-idle-animation`.
   * Clique com o **botão direito** e selecione **"Abrir no Terminal"**.

2. **Execute o comando de teste:**
   ```bash
   lime test html5
