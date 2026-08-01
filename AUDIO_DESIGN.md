# AUDIO_DESIGN.md

## Objetivo

Este documento define como o áudio do jogo deve funcionar.

O áudio não é enfeite. Ele faz parte da gameplay, da narrativa e da tensão.

---

## Filosofia

O áudio precisa:

- aumentar a imersão
- avisar perigo
- reforçar narrativa
- guiar o ritmo
- diferenciar estados do jogo

Cada som deve ter função clara.

---

## Categorias de áudio

### Música ambiente
Cria clima, silêncio, estranheza e suspense.

### Música de ameaça
Ativa durante perseguição, boss ou situação crítica.

### Efeitos de interface
Clique, confirmação, erro, seleção, pausa.

### Efeitos do jogador
Passos, respiração, ação, coleta, dano, interação.

### Efeitos do mundo
Portas, máquinas, luzes, ruído, vento, interferência.

### Efeitos de entidades
Rugido, ruído, aproximação, presença, ataque.

### Stingers
Som curto e marcante para evento importante, susto ou transição.

---

## Regras gerais

- Todo áudio deve ter propósito.
- O volume deve ser balanceado por categoria.
- O jogo precisa continuar compreensível mesmo com o áudio desligado.
- O áudio deve complementar a narrativa, não contradizê-la.
- Sons repetitivos demais cansam o jogador.

---

## Sistema de volume

Separar volume em grupos:

- master
- música
- efeitos
- interface
- vozes, se houver
- ambiente
- entidades

### Regras
- Cada grupo precisa de controle próprio.
- O jogador deve poder ajustar tudo nas configurações.
- O volume deve ser salvo no sistema de save.

---

## Áudio dinâmico

O áudio precisa reagir ao contexto.

### Exemplos
- exploração silenciosa
- aumento de tensão ao entrar em área perigosa
- perseguição com trilha acelerada
- boss com tema próprio
- ambiente distorcido em áreas corrompidas

### Regras
- transições devem ser suaves sempre que possível
- o jogo pode usar fade in e fade out
- mudanças bruscas só devem ocorrer quando fizerem sentido

---

## Sons do jogador

### Necessários
- passos
- correr
- agachar
- interação
- abrir inventário
- pegar item
- dano
- morte
- respiração em tensão

### Regras
- os passos devem mudar conforme o piso, se possível
- a respiração pode variar de acordo com estado físico ou medo
- som de ação não deve saturar a cena

---

## Sons do mundo

O mundo precisa parecer vivo e ameaçador.

### Exemplos
- portas antigas
- máquinas ligando e desligando
- luzes estalando
- ruído elétrico
- eco em corredores
- vento em áreas vazias
- interferência e glitch, se for tema do jogo

---

## Sons de entidades

### Objetivo
Dar identidade para cada ameaça.

### Regras
- cada entidade importante deve ter assinatura sonora própria
- o som deve ajudar na antecipação do perigo
- sons de aproximação precisam ser reconhecíveis
- o boss principal deve ter trilha ou motivo sonoro memorável

---

## Música de perseguição

### Função
Indicar que o jogador está em perigo real.

### Regras
- começar quando a ameaça for confirmada
- terminar quando a situação acabar
- não tocar sem motivo
- evitar loop cansativo

### Elementos úteis
- batida acelerada
- camadas de ruído
- distorção
- ataques musicais curtos

---

## Silêncio

Silêncio também é ferramenta.

### Regras
- não preencher tudo com som
- usar pausas para gerar suspense
- deixar o jogador ouvir o ambiente
- alternar entre silêncio e tensão com inteligência

---

## Sistema de eventos sonoros

Eventos podem disparar sons específicos.

### Exemplos
- porta aberta
- item coletado
- documento lido
- boss apareceu
- checkpoint salvo
- puzzle resolvido
- morte do jogador

### Regras
- cada evento importante precisa de feedback sonoro
- eventos de confirmação devem ser suaves
- eventos de perigo devem ser mais agressivos

---

## Áudio e acessibilidade

O sistema deve considerar jogadores com necessidades diferentes.

### Regras
- legendas para falas, se houver
- volume ajustável por categoria
- possibilidade de reduzir efeitos de susto sonoro, se implementado
- clareza mesmo com som baixo

---

## Organização de arquivos

### Sugestão
- `audio/music/`
- `audio/ambience/`
- `audio/sfx/player/`
- `audio/sfx/world/`
- `audio/sfx/entities/`
- `audio/ui/`
- `audio/stingers/`
- `audio/voices/`

### Convenção de nomes
- `music_explore_01`
- `sfx_door_open_01`
- `sfx_entity_breath_01`
- `ui_confirm_01`

---

## Implementação recomendada

- criar um gerenciador central de áudio
- separar música de efeitos
- usar estados do jogo para trocar trilhas
- limitar sons simultâneos quando necessário
- priorizar efeitos importantes em relação a sons secundários

---

## Checklist de qualidade

Antes de considerar o áudio pronto:

- O jogo tem silêncio quando precisa?
- A perseguição tem identidade sonora?
- Os sons do jogador estão claros?
- O boss tem presença sonora?
- O áudio pode ser ajustado por categoria?
- O som ajuda a entender o que está acontecendo?

Se a resposta for sim, o áudio está fazendo o trabalho dele.
