# compprog
personal repo for competitive programming



## configurando o pc no grad
No **Ubuntu**, abra o terminal e rode:
```bash
mkdir -p ~/Documents/contest && cd ~/Documents/contest
wget -qO grad_setup.sh https://raw.githubusercontent.com/vini-baumel/compprog/main/grad_setup.sh
bash grad_setup.sh
code --extensions-dir "$HOME/.vscode/extensions" . && exit
```
Isso faz a configuração, abre o VS Code na pasta e fecha o terminal.

Para abrir o VS Code configurado de novo, feche todas as janelas do VS Code, abra um terminal e rode:
```bash
cd ~/Documents/contest
codecpp .
```
Abrir o VS Code de outro jeito (pelo menu ou com `code .`) não carrega as extensões (C/C++ e CPH).

**Atalhos:** `Ctrl+Shift+B` compila, `F5` debuga (digite a entrada no terminal que abrir), `Ctrl+Alt+B` abre o CPH.
