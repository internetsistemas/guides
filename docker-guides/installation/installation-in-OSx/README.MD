# Instalação do Docker no OSX

Para instalar o docker no OSx existe duas maneiras, a simples e uma mais complexa. Claro que queremos sempre a mais simples, no entanto não funciona bem assim. Antes de tudo é necessário verificar se o seu CPU é compatível com Hypervisor.framework, pois é preciso esse cara para rodar o Docker, bem provável que MacBooks fabricados a partir de 2011 são compatíveis. Para isso execute o comando: 

```
sysctl kern.hv_support 
```

### kern.hv_support: 1

Caso o seu resultado seja "kern.hv_support: 1”, você se encaixa na maneira mais simples de instalar o docker, basta utilizar o [Docker for Mac](https://docs.docker.com/docker-for-mac/).

Basicamente você baixa o arquivo .dmg, clicando e arrastando para Aplicativo (procedimento padrão de instalação no OSx):

![docker_dmg](/docker-guides/installation/installation-in-OSx/photos/docker_dmg.png)

Feito isso ira criar um ícone em sua área de aplicativos:

![docker_app](/docker-guides/installation/installation-in-OSx/photos/docker_app.png)

A baleia na barra de status superior indica que Docker está em execução e acessível a partir de um terminal.

![higher_status](/docker-guides/installation/installation-in-OSx/photos/higher_status.png)

Você pode também configurar o Docker, como por exemplo a quantidade de memória destinada ao uso do docker.

![preferences](/docker-guides/installation/installation-in-OSx/photos/preferences.png)

Feito, instalação concluída, agora só utilizar ele no terminal normalmente.

Caso queira ver as versões instaladas no terminal basta executar. 

```
docker --version 
docker-compose
docker-machine
```

### kern.hv_support: 0

Agora após executar o comando "sysctl kern.hv_support” e o resultado for 0, ae começa a brincadeira. 

No site oficial do Docker existe a solução de instalar o Docker Toolbox on macOS, porém em alguns testes não foi a melhor opção, pois ele utiliza uma vm embutida, e o desempenho não ficou bom, pois a vm é para o Docker e a pasta do projeto do Git fica em sua maquina local e essa conversa entre eles acaba ficando lento demais, pode ser que exista uma maneira de ajustar isso, porem como o tempo é uma moeda irreversível e não identificamos muitas soluções na internet, fomos para o mais obvio:

Resumindo é a criação de uma Maquina Virtual de preferencia Linux apenas com terminal sem a interface gráfica, pois iremos utilizar apenas o docker e o git e todo manuseio do projeto será feito no OSx por exemplo utilizando o Sublime, com o recurso de compartilhamento de arquivos entre a VM e o OSx, caso você queira utilizar uma versão linux com interface gráfica e fazer tudo por ela, digo usar o docker, sublime ou vim, enfim fica a seu critério, mas a idéia é basicamente a utilização da VM linux. 

Na continuação desse guides iremos utilizar na VM a SO Ubuntu Server, [instalação normal](https://www.youtube.com/watch?v=MaAqAx77COM&index=54&list=WL)


**Agora segue alguns opcionais:**

[Acessar sua VM via SSH](https://www.youtube.com/watch?v=59zThEMPxyQ&index=53&list=WL)

[Samba com a VM](https://www.youtube.com/watch?v=ndAYZ0DJ-U4&index=57&list=WL), utilizando o repositorio Git na VM porem editando pelo OSx usando por exemplo o Sublime.

***Detalhe***: Devido a questão de permissão é necessário liberar acesso a pasta na VM para o uso no OSX, Rode “chmod -R 777”, por exemplo:

```
chmod -R 777 /home/youruser/some_project
```

como estamos usando uma VM com poucos recursos não há problema em usar o 777. 
Devido a problemas de liberação de acesso no GIT é necessário também rodar o seguinte comando:

```
git config core.fileMode false
```

#### Instalando Docker no Ubuntu Server

Agora vamos instalar o Docker Compose. Inicie a sua VM e rode o seguinte comando:

```
curl -L https://github.com/docker/compose/releases/download/VERSION_NUM/docker-compose-`uname -s`-`uname -m` &amp;gt; /usr/local/bin/docker-compose
```

**Depois**

```
chmod +x /usr/local/bin/docker-compose
```

**Teste o docker executando:**

```
docker-compose --version
```

**Caso tenha problema execute:**

```
apt-get install python-pip -y
```

```
pip install -U docker-compose
```

Caso tenha uma dificuldade na instalação do Docker no Ubuntu Server [Clique aqui](https://www.youtube.com/watch?v=8zlE9hg4rqU&index=55&list=WL)


Pronto.

