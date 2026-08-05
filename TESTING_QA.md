# TESTING_QA.md

## Objetivo

Este documento define como testar o jogo e validar qualidade antes de qualquer versão ser considerada estável.

Sem testes, o projeto vira loteria. Com testes, ele vira produção.

---

## Filosofia de QA

- Testar cedo.
- Testar sempre que mudar algo importante.
- Testar em partes e no fluxo completo.
- Registrar bugs com clareza.
- Corrigir o que quebra o jogador primeiro.

---

## Tipos de teste

### 1. Teste funcional
Verifica se a mecânica faz o que deveria fazer.

### 2. Teste de integração
Verifica se sistemas diferentes funcionam juntos.

### 3. Teste de regressão
Verifica se uma correção não quebrou outra coisa.

### 4. Teste de balanceamento
Verifica dificuldade, ritmo e punição.

### 5. Teste narrativo
Verifica se eventos, diálogos e capítulos continuam coerentes.

### 6. Teste de performance
Verifica queda de FPS, travamentos e carregamento.

### 7. Teste de usabilidade
Verifica clareza de interface, menus e feedback.

---

## Áreas que precisam ser testadas

- jogador
- movimento
- câmera
- interação
- inventário
- save/load
- eventos
- inimigos
- bosses
- puzzles
- capítulos
- UI/UX
- áudio
- cutscenes
- mapa
- documentos

---

## Checklist por sistema

### Jogador
- anda corretamente
- corre corretamente
- agacha corretamente
- interage com objetos
- recebe dano
- morre quando necessário
- recupera estado corretamente

### Inventário
- adiciona itens
- remove itens
- não duplica itens únicos
- mostra descrição correta
- usa item certo no momento certo

### Save
- salva corretamente
- carrega corretamente
- mantém flags
- mantém inventário
- mantém progresso do capítulo
- não corrompe dados

### Inimigos
- detectam o jogador
- respondem a som ou visão
- perseguem com limite correto
- retornam ao estado base
- não travam em parede

### Bosses
- entram nas fases corretas
- mostram ataques esperados
- morrem no momento certo
- liberam evento de conclusão
- não quebram o mapa

### Puzzles
- começam em estado correto
- aceitam solução certa
- rejeitam solução errada
- registram conclusão
- não travam a progressão

### UI
- textos legíveis
- botões respondem
- menus abrem e fecham
- notificações aparecem no tempo certo
- HUD não polui a tela

---

## Fluxo de teste recomendado

### Fase 1 — teste isolado
Testar cada sistema separado.

### Fase 2 — teste combinado
Testar dois ou mais sistemas ao mesmo tempo.

### Fase 3 — teste de capítulo
Testar o capítulo do início ao fim.

### Fase 4 — teste completo
Testar a campanha inteira sem pular etapas.

### Fase 5 — teste final
Testar uma versão quase pronta em condição de release.

---

## Testes críticos

Esses testes não podem falhar:

- abrir o jogo
- iniciar novo save
- carregar save
- avançar de capítulo
- resolver puzzle principal
- enfrentar boss
- morrer e voltar
- pausar e retomar
- retornar ao menu
- fechar o jogo sem erro

---

## Bugs

### Classificação
- crítico
- alto
- médio
- baixo

### Exemplo de registro

```text
ID: BUG_001
Título: Porta não abre após evento
Sistema: Evento / Mapa
Severidade: Alto
Passos para reproduzir:
1. Entrar na sala
2. Ativar alavanca
3. Tentar abrir a porta
Resultado esperado: porta abre
Resultado atual: porta continua trancada
```

---

## Regras de correção

- Corrigir primeiro o que impede progresso.
- Corrigir depois o que quebra save.
- Corrigir depois o que afeta boss ou capítulo.
- Corrigir depois o que só incomoda visualmente.

---

## Teste de regressão

Sempre que um bug for corrigido, revisar:

- o mesmo sistema
- sistemas conectados
- capítulo relacionado
- save relacionado
- UI relacionada

---

## Balanceamento

### O que observar
- dificuldade por capítulo
- dano dos inimigos
- tempo de perseguição
- frequência de aparição
- quantidade de recursos
- clareza de pistas

### Regra
Se o jogador morre demais sem aprender nada, o design está errado.

---

## Performance

### Verificar
- tempo de carregamento
- uso de memória
- travamento em troca de cena
- excesso de entidades ativas
- queda em cenas com muitos efeitos

### Regras
- otimizar antes de empilhar conteúdo pesado
- reduzir duplicação de lógica
- evitar carregar tudo de uma vez

---

## QA por capítulo

Cada capítulo deve ter seu próprio checklist:

- intro funciona
- objetivo aparece
- novas mecânicas funcionam
- documento importante está acessível
- inimigo correto aparece
- boss funciona, se houver
- final do capítulo registra progresso

---

## QA narrativo

### Verificar
- diálogos corretos
- eventos na ordem certa
- flags batendo com a história
- cutscenes sem conflito
- capítulos coerentes entre si
- finais desbloqueando corretamente

---

## Ferramentas sugeridas

- logs de execução
- console de debug
- prints temporários
- telemetria simples
- lista de flags
- mapa de eventos
- relatório de bugs

---

## Organização de arquivos

### Sugestão
- `qa/checklists/`
- `qa/bugs/`
- `qa/regression/`
- `qa/performance/`
- `qa/narrative/`
- `qa/chapter_tests/`

---

## Checklist final de release

Antes de liberar uma versão:

- O jogo inicia sem erro?
- O save funciona?
- O capítulo 1 fecha certo?
- O capítulo final não quebra?
- O boss principal funciona?
- A UI está clara?
- O áudio não está desbalanceado?
- Não existe bug crítico conhecido?
- A progressão está inteira?
- Os arquivos de documentação estão atualizados?

Se tudo isso estiver ok, a versão pode seguir em frente.
