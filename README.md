1- Eu escolhi a opção A para fazer o teste.
2- Fiz o diferencial de criar um botão play/pause para a animação.
3- Ao tentar abrir o arquivo index.html é provavel que aconteça o mecanismo de segurança CORS. Isso acontece porque, por padrão, navegadores como Firefox e Chrome bloqueiam requisições de recursos (como imagens) através do protocolo file:// por razões de segurança.
    Soluções:
    
    OPÇÃO A:
    1- Abrir o terminal na pasta onde está o index.html
        Você pode abrir a pasta normalmente
        Clicar com o botão direito do mouse
        Clicar em abrir terminal
    2- Abrir um servidor local digitando no terminal os comandos abaixo.
    macOS/Linux: python3 -m http.server 8000
    windows: python -m http.server 8000
    
    E então acesse no navegador http://localhost:8000

    OPÇÃO B:
    1- Abrir o terminal na pasta pack-teste-idle-animation
        Você pode abrir a pasta normalmente
        Clicar com o botão direito do mouse
        Clicar em abrir terminal
    2- No terminal digital lime test html5 e então o projeto vai abrir no navegador
        
        
