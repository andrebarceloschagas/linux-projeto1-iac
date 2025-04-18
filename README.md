# Projeto: Script de Infraestrutura como Código (IaC)

Este projeto contém um script Bash para automatizar a criação de uma infraestrutura básica em um ambiente Linux. O script realiza tarefas como criação de grupos, diretórios, definição de permissões e criação de usuários, seguindo boas práticas de organização e segurança.

## Funcionalidades

O script realiza as seguintes operações:

1. **Criação de Grupos de Usuários**:
   - `GRP_ADM`: Grupo administrativo.
   - `GRP_VEN`: Grupo de vendas.
   - `GRP_SEC`: Grupo de segurança.

2. **Criação de Diretórios**:
   - `/publico`: Diretório público acessível a todos.
   - `/adm`: Diretório exclusivo para o grupo `GRP_ADM`.
   - `/ven`: Diretório exclusivo para o grupo `GRP_VEN`.
   - `/sec`: Diretório exclusivo para o grupo `GRP_SEC`.

3. **Definição de Donos e Grupos dos Diretórios**:
   - Os diretórios são atribuídos aos grupos correspondentes para controle de acesso.

4. **Definição de Permissões**:
   - `/publico`: Permissão total para todos (`777`).
   - `/adm`, `/ven`, `/sec`: Permissão total apenas para o dono e o grupo correspondente (`770`).

5. **Criação de Usuários**:
   - Usuários são criados e atribuídos aos grupos correspondentes.
   - As senhas dos usuários são solicitadas de forma interativa durante a execução do script.

## Pré-requisitos

- Sistema operacional Linux.
- Permissões de administrador (root) para executar o script.
- O utilitário `openssl` instalado para gerar hashes de senha.

## Como Executar

1. Clone este repositório ou copie o script para o seu ambiente local.
2. Dê permissão de execução ao script:
   ```bash
   chmod +x iac_script.sh
   ```
3. Execute o script como administrador:
   ```bash
   sudo ./iac_script.sh
   ```
4. Durante a execução, insira as senhas para os usuários de cada grupo quando solicitado.

## Estrutura do Script

- **Criação de Grupos**: Define os grupos necessários para a organização.
- **Criação de Diretórios**: Cria os diretórios que serão usados pelos grupos.
- **Definição de Permissões**: Configura as permissões de acesso para cada diretório.
- **Criação de Usuários**: Adiciona usuários aos grupos e define suas senhas.

## Exemplo de Saída

Ao executar o script, você verá mensagens indicando o progresso das operações, como:

```
Iniciando a criação da infraestrutura...
Criando grupos de usuários...
Grupos criados.
Criando diretórios...
Diretórios criados.
Definindo donos e grupos dos diretórios...
Donos e grupos definidos.
Definindo permissões dos diretórios...
Permissões definidas.
Infraestrutura criada com sucesso!
Criando usuários e adicionando aos grupos...
Usuários criados e adicionados aos grupos.
Fim da execução do script.
```

## Observações

- **Segurança**: As senhas dos usuários são solicitadas de forma interativa e não ficam expostas no script.
- **Personalização**: Você pode editar o script para adicionar mais grupos, diretórios ou usuários conforme necessário.

## Autor

Este projeto foi desenvolvido por [@andrebarceloschagas](github.com/andrebarceloschagas). Sinta-se à vontade para contribuir ou sugerir melhorias.

## Licença

Este projeto está licenciado sob a MIT License.