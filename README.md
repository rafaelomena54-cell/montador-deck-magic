# Montador de Deck Magic — instalação simplificada

Este projeto já está preparado para publicação no Render. **Você não precisa configurar Supabase para começar a usar.**

## Caminho mais simples

### 1. Coloque o projeto no GitHub
- Baixe e extraia o ZIP.
- Entre em https://github.com e crie um repositório novo.
- Envie todos os arquivos e pastas extraídos para esse repositório. Não envie o ZIP fechado.

### 2. Publique no Render
- Entre em https://render.com e crie uma conta.
- Escolha **New + → Blueprint** (ou conecte o repositório GitHub).
- Selecione o repositório deste aplicativo.
- O Render encontrará o arquivo `render.yaml` e configurará o serviço.
- Clique em **Apply** / **Deploy** e aguarde a publicação.
- Ao terminar, o Render mostrará um endereço HTTPS para o aplicativo.

### 3. Instale no Android
- Abra o endereço HTTPS no Chrome do celular.
- Toque no menu ⋮ e escolha **Instalar app** ou **Adicionar à tela inicial**.

Pronto. A busca de cartas usa a API pública do Scryfall e precisa de internet.

## Salvamento dos decks
- **Salvar neste aparelho** funciona sem conta e sem configuração extra. Os decks ficam no armazenamento do navegador daquele aparelho.
- A sincronização entre aparelhos é opcional e exige configurar Supabase. Só faça isso se quiser a nuvem; as instruções e o SQL estão em `supabase/` e no arquivo `mobile/static/config.js`.
- Nunca coloque senha de conta, chave `service_role` ou qualquer chave secreta no aplicativo. Para a configuração opcional, use somente a chave pública `anon` com RLS habilitado.

## Observações
- Para atualizar o aplicativo depois, envie os arquivos atualizados ao mesmo repositório GitHub; o Render fará novo deploy.
- O plano gratuito do Render pode suspender o serviço após um período sem uso. A primeira abertura depois disso pode demorar.
- As regras especiais de cada formato e listas de banidas/restritas devem ser conferidas. Os indicadores do aplicativo são estatísticas e alertas simples, não uma avaliação competitiva do deck.
