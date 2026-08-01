# GAMEPLAY_SYSTEMS.md

## Objetivo

Este arquivo define os sistemas centrais de gameplay para orientar implementação real, modular e estável.

A ideia aqui é simples: se a IA ou qualquer pessoa for codar este jogo, ela deve conseguir abrir este documento e entender o que precisa existir, como os sistemas conversam entre si e quais regras não podem ser quebradas.

---

## 1. Loop principal do jogo

O loop base do jogo deve seguir esta lógica:

**Explorar → Observar → Interagir → Sobreviver → Progredir → Salvar**

### Regras do loop
- O jogador precisa entender sempre qual é o próximo objetivo.
- O jogo deve alternar entre calma, tensão e ameaça.
- A progressão precisa ser travada por eventos, itens, chaves, flags narrativas ou puzzles.
- Nenhum sistema pode depender da interface para funcionar.

---

## 2. Sistema do jogador

O jogador é o centro de tudo. Esse sistema precisa ser confiável e previsível.

### Responsabilidades
- Movimento
- Câmera
- Interação
- Uso de itens
- Inventário
- Estado físico e mental
- Resposta a dano, susto ou perseguição

### Estados do jogador
- normal
- correndo
- agachado
- interagindo
- ferido
- assustado
- travado por evento
- morto

### Regras
- O jogador nunca deve perder controle sem um motivo documentado.
- Toda perda de controle precisa ser causada por evento, cutscene ou status.
- O sistema de movimento não pode depender do inventário.
- Câmera e movimento devem ser separados, mesmo que conversem entre si.

---

## 3. Movimento

### Funções esperadas
- andar
- correr
- agachar
- virar câmera
- olhar para pontos de interesse
- resposta a colisão

### Regras técnicas
- O movimento deve respeitar colisão do mapa.
- Corrida deve consumir energia, se houver stamina.
- Agachar deve mudar altura de colisão, se aplicável.
- Movimento precisa ser ajustável por configuração.

---

## 4. Interação

A interação é uma das partes mais importantes do jogo.

### Objetos interagíveis
- portas
- gavetas
- botões
- alavancas
- computadores
- NPCs
- notas
- chaves
- itens de coleta
- mecanismos de puzzle

### Modelo de interação
Todo objeto interagível deve ter:
- nome interno
- tipo
- condição de uso
- feedback visual ou sonoro
- ação executada

### Regras
- Se o objeto não puder ser usado, o jogo deve explicar o motivo.
- Interação deve ser contextual.
- O texto de interação deve ser curto e claro.
- Objetos importantes precisam de prioridade no raycast ou sistema equivalente.

---

## 5. Inventário

O inventário precisa ser simples de usar e difícil de quebrar.

### Categorias de itens
- chave
- missão
- consumível
- documento
- equipamento
- chave de puzzle
- item especial

### Regras do inventário
- Itens únicos não podem duplicar.
- Itens de missão devem ficar claramente marcados.
- Itens consumíveis devem ser removidos após uso.
- O inventário deve permitir ver descrição e função.

### Funções essenciais
- adicionar item
- remover item
- verificar item
- usar item
- organizar por categoria
- mostrar item destacado

### Observação importante
O inventário não deve tomar decisões narrativas sozinho. Ele apenas guarda e entrega dados.

---

## 6. Vida, sanidade e stamina

Esses atributos sustentam a tensão do jogo.

### Vida
Representa a resistência física do jogador.

### Sanidade
Representa o impacto psicológico, medo ou corrupção mental.

### Stamina
Representa energia para correr, agir sob pressão ou executar ações físicas.

### Regras gerais
- A UI precisa mostrar o estado atual de forma clara.
- Dano precisa ter feedback imediato.
- Recuperação deve existir, mas nunca de forma exagerada.
- Estados críticos devem mudar a experiência do jogador, não só os números.

---

## 7. Inimigos comuns

Inimigos normais existem para pressionar o jogador e criar ritmo.

### Estados base
- idle
- patrulha
- investigando
- alerta
- perseguição
- ataque
- retorno
- derrotado

### Sensores possíveis
- visão
- audição
- proximidade
- gatilho de evento

### Regras
- Cada inimigo deve ter comportamento próprio.
- A IA precisa ser testável em isolamento.
- Inimigos não devem depender da UI.
- A agressividade pode mudar por capítulo ou área.

---

## 8. Bosses

Boss não é só inimigo grande. Boss precisa de estrutura própria.

### Requisitos
- máquina de estados exclusiva
- fases bem definidas
- ataques únicos
- janela de vulnerabilidade
- gatilhos de transição
- integração com eventos do capítulo

### Estrutura recomendada
- fase 1: apresentação
- fase 2: agressividade crescente
- fase 3: quebra de padrão
- fase final: clímax

### Regras
- Boss deve ser documentado em arquivo próprio quando entrar no projeto.
- O comportamento do boss não deve ser copiado e colado de inimigo comum sem adaptação.
- Transições precisam ter animação, áudio ou evento de destaque.

---

## 9. Quebra-cabeças

Puzzles são essenciais para ritmo e progressão.

### Tipos possíveis
- senha
- sequência
- energia
- ativação por ordem
- combinação de itens
- leitura de pistas
- alinhamento visual

### Regras
- Puzzle deve ter lógica clara, mesmo que o jogador não perceba de primeira.
- Pistas devem existir no cenário.
- O sistema deve evitar travar a progressão por bug.
- Uma vez resolvido, o puzzle precisa registrar estado.

---

## 10. Eventos

Eventos são a espinha dorsal da progressão.

### Tipos de gatilho
- entrar em área
- pegar item
- abrir porta
- terminar diálogo
- ativar objeto
- sobreviver por tempo
- completar puzzle
- vencer boss

### Regras técnicas
- Evento deve ser executado uma vez ou com repetição controlada.
- Flags de evento precisam ser salvas.
- Eventos não devem depender de ordem confusa.
- Qualquer evento importante precisa estar documentado.

---

## 11. Progressão por capítulo

O jogo deve ser dividido em capítulos para facilitar produção e narrativa.

### Cada capítulo deve ter
- introdução
- objetivo
- ameaça central
- progressão em áreas
- momento de tensão
- fechamento ou gancho

### Regras
- Cada capítulo deve poder ser testado separadamente.
- Capítulos não devem compartilhar lógica de forma bagunçada.
- Eventos do capítulo precisam ser isolados quando possível.

---

## 12. Save e load

O sistema de salvar é obrigatório.

### Deve salvar
- capítulo atual
- posição do jogador
- vida, sanidade e stamina
- inventário
- estado de inimigos relevantes
- flags narrativas
- configurações do jogador

### Regras
- Carregar deve validar dados.
- Save corrompido não pode quebrar o jogo inteiro.
- Checkpoints devem existir em pontos seguros.
- A gravação deve ocorrer em momentos bem definidos.

---

## 13. HUD e interface

A interface precisa informar sem poluir.

### Elementos comuns
- barra de vida
- barra de sanidade
- barra de stamina
- objetivo atual
- aviso de interação
- item coletado
- mensagem de perigo

### Regras
- HUD deve ser discreto.
- Interface precisa sumir em cutscene se necessário.
- O jogador deve entender a situação sem excesso de texto.

---

## 14. Áudio de gameplay

Áudio é parte do sistema, não enfeite.

### Categorias
- música ambiente
- música de perseguição
- efeitos de interação
- ruídos do mapa
- efeitos de susto
- voz ou comunicação, se houver

### Regras
- O áudio precisa reagir ao estado do jogo.
- Perseguição e perigo devem ter identidade sonora clara.
- Volume deve ser separado por categoria.

---

## 15. Regras de implementação

### Obrigatório
- Um sistema por responsabilidade.
- Código pequeno e reaproveitável.
- Variáveis e funções com nomes claros.
- Documentação atualizada junto da mecânica.
- Testes antes de integrar com outros sistemas.

### Proibido
- Colocar tudo em um arquivo só.
- Misturar UI com lógica principal.
- Criar sistema sem definir estado.
- Depender de solução improvisada para algo crítico.
- Esconder bug em vez de corrigir.

---

## 16. Ordem de desenvolvimento recomendada

1. Jogador
2. Interação
3. Inventário
4. Eventos
5. Save/load
6. HUD
7. Inimigos comuns
8. Bosses
9. Puzzles
10. Capítulos completos

---

## 17. Regra final

Se um sistema novo for criado, ele deve responder a três perguntas antes de entrar no jogo:

- O que ele faz?
- Com o que ele conversa?
- O que ele pode quebrar?

Se essas respostas não estiverem claras, o sistema ainda não está pronto.
