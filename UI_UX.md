# UI_UX.md

## Objetivo

Este documento define as diretrizes de interface e experiência do usuário para o jogo.

A UI precisa ser clara, discreta, funcional e coerente com a atmosfera do projeto.

---

## Princípios de design

- Clareza acima de enfeite.
- Imersão acima de excesso visual.
- Consistência acima de improviso.
- Resposta rápida acima de animações desnecessárias.
- O jogador precisa entender a interface em poucos segundos.

---

## Filosofia visual

A interface deve reforçar o clima do jogo sem competir com o cenário.

### Regras
- Não poluir a tela.
- Usar contraste com cuidado.
- Exibir somente o necessário.
- Reservar elementos chamativos para momentos críticos.

---

## HUD principal

### Elementos possíveis
- vida
- sanidade
- stamina
- objetivo atual
- item coletado
- aviso de interação
- status de perigo
- indicador de missão

### Regras
- HUD deve ser minimalista.
- Elementos críticos precisam ser fáceis de ler.
- Informações secundárias podem aparecer de forma temporária.
- O jogador deve poder jogar sem ficar olhando para interface o tempo todo.

---

## Menus

### Menus esperados
- menu principal
- pausa
- inventário
- configurações
- carregamento de save
- seleção de slot
- créditos

### Regras
- Menus devem ter navegação simples.
- Voltar sempre precisa ser evidente.
- A hierarquia visual precisa ser clara.
- O menu não deve parecer confuso nem “cheio demais”.

---

## Fluxo de navegação

O jogador deve conseguir:

- entrar no jogo
- pausar
- revisar inventário
- ajustar opções
- salvar ou carregar
- voltar ao jogo

sem precisar aprender um ritual secreto de três telas e uma reza.

---

## Tipografia

### Diretrizes
- Usar fonte legível.
- Priorizar leitura em tamanhos pequenos.
- Evitar excesso de estilos.
- Manter consistência entre títulos, menus e avisos.

### Regras
- Títulos podem ser mais expressivos.
- Texto informativo precisa ser simples.
- Mensagens críticas devem ter alto contraste.

---

## Cores

### Uso recomendado
- cor neutra para base
- cor de destaque para interação
- cor de alerta para perigo
- cor especial para narrativa ou boss

### Regras
- Não usar muitas cores competindo entre si.
- A paleta precisa combinar com terror, suspense ou tensão.
- Elementos importantes devem se destacar naturalmente.

---

## Feedback visual

Toda ação importante precisa responder visualmente.

### Exemplos
- item coletado
- porta trancada
- erro de interação
- puzzle resolvido
- save concluído
- dano recebido
- perigo detectado

### Regras
- o feedback deve ser rápido
- o feedback deve ser claro
- o feedback não pode travar a tela sem motivo

---

## Inventário

### Requisitos de UX
- fácil de navegar
- mostrar categorias
- destacar item selecionado
- exibir descrição útil
- permitir uso sem confusão

### Regras
- o inventário não deve esconder informação importante
- itens de missão precisam ser visíveis
- itens consumíveis precisam ser rápidos de usar

---

## Configurações

### Opções mínimas
- volume
- brilho
- sensibilidade
- idioma
- controles
- acessibilidade

### Regras
- cada opção deve ter descrição clara
- alterações devem ser aplicadas sem drama
- o usuário precisa entender o que está ajustando

---

## Mensagens na tela

### Tipos
- instrução curta
- aviso de perigo
- confirmação
- erro
- objetivo atualizado
- evento narrativo

### Regras
- frases curtas funcionam melhor
- a mensagem precisa aparecer pelo tempo certo
- excesso de texto quebra o ritmo

---

## Acessibilidade

O jogo precisa considerar diferentes formas de leitura e uso.

### Recursos recomendados
- contraste adequado
- legenda para falas ou informações importantes
- volumes separados
- textos legíveis
- símbolos acompanhados de texto quando necessário

### Regras
- não depender apenas de cor
- não depender apenas de som
- não depender de ícone sem explicação

---

## Estados da interface

### Estados comuns
- normal
- alerta
- perigo
- inventário aberto
- pausa
- cutscene
- diálogo
- boss

### Regras
- cada estado deve mudar a interface de forma controlada
- interfaces secundárias não podem conflitar com cutscenes
- a troca de estado deve ser suave

---

## Animação de UI

### Regras
- animações devem ser curtas
- transições precisam ser limpas
- não exagerar em efeitos só porque fica bonito no editor
- o movimento da UI deve servir a leitura, não distrair

---

## Layout

### Diretrizes
- usar alinhamento consistente
- manter espaçamento previsível
- organizar elementos em blocos lógicos
- evitar telas sobrecarregadas

### Regra
Se a tela precisa de legenda para explicar a própria legenda, ela já errou.

---

## Interface de terror

Como o jogo tem tensão e suspense, a UI pode acompanhar isso.

### Exemplos
- tremor leve em momentos críticos
- distorção sutil em eventos sobrenaturais
- alteração de cor em perigo
- aparecimento gradual de elementos importantes

### Regras
- usar efeitos com moderação
- não prejudicar leitura
- não deixar o jogador cansado visualmente

---

## Organização de arquivos

### Sugestão
- `ui/hud/`
- `ui/menus/`
- `ui/dialogs/`
- `ui/notifications/`
- `ui/icons/`
- `ui/themes/`

### Regras
- separar assets de componentes
- manter nomes claros
- documentar elementos reutilizáveis

---

## Checklist de UI/UX

Antes de considerar a interface pronta, verificar:

- O jogador entende o que está vendo?
- O HUD está limpo?
- O inventário é fácil de usar?
- Os menus são claros?
- As mensagens são curtas e úteis?
- A interface combina com o clima do jogo?
- A leitura funciona em tensão e movimento?

Se a resposta for sim, a interface está cumprindo o papel dela.
