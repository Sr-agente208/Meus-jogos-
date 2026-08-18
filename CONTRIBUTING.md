# CONTRIBUTING.md

## Objetivo

Este documento define como pessoas e IAs devem contribuir com o projeto sem quebrar sua arquitetura, narrativa ou estabilidade.

---

## Antes de alterar qualquer coisa

Leia nesta ordem:

1. `README.md`
2. `PROJETO.txt`
3. `ARENA_AI.md`
4. `GAME_ARCHITECTURE.md`
5. O documento específico do sistema que será alterado

Não comece uma mudança grande sem entender as dependências.

---

## Princípios

- Preserve funcionalidades existentes.
- Prefira mudanças pequenas e verificáveis.
- Não duplicar sistemas já existentes.
- Não misturar responsabilidades.
- Atualizar documentação junto da implementação.
- Manter narrativa e gameplay consistentes.

---

## Processo de contribuição

### 1. Entender

Identifique:

- qual sistema será alterado
- quais arquivos participam
- quais outros sistemas dependem dele
- quais testes precisam ser executados

### 2. Planejar

Antes de codar:

- definir objetivo
- definir impacto
- escolher arquivos envolvidos
- definir critério de sucesso

### 3. Implementar

A implementação deve:

- ser modular
- ter nomes claros
- evitar lógica duplicada
- preservar APIs internas quando possível

### 4. Testar

Execute os testes relacionados à alteração antes do commit.

### 5. Documentar

Atualize o documento técnico correspondente quando uma regra, fluxo ou sistema mudar.

---

## Commits

Usar mensagens claras:

- `feat:` nova funcionalidade
- `fix:` correção
- `docs:` documentação
- `refactor:` reorganização interna
- `style:` alteração visual sem mudança de lógica
- `assets:` novos ou atualizados assets
- `build:` alteração no processo de build
- `test:` testes
- `perf:` otimização
- `chore:` manutenção

### Exemplos

```text
feat: adiciona sistema de interação
fix: corrige transição da perseguição
perf: reduz custo da IA de inimigos

docs: atualiza sistema de save
```

---

## Commits pequenos

Evitar commits que misturem várias coisas sem relação.

Ruim:

```text
feat: adiciona boss, menu, áudio e corrige save
```

Melhor:

```text
feat: adiciona IA do boss
feat: adiciona arena do boss
audio: adiciona efeitos do boss
fix: corrige save após derrota do boss
```

---

## Pull Requests

Quando houver fluxo de PR:

- explicar o que mudou
- explicar por que mudou
- indicar arquivos importantes
- informar testes realizados
- registrar limitações conhecidas

### Checklist mínimo

- código testado
- documentação atualizada
- sem arquivos temporários
- sem credenciais ou segredos
- sem mudanças não relacionadas

---

## Regras para IAs

IAs que contribuírem com o projeto devem:

- ler a documentação relevante antes de modificar código
- não inventar sistemas conflitantes
- não substituir uma arquitetura existente sem justificativa
- sinalizar suposições importantes
- preferir reutilizar sistemas já existentes
- manter commits objetivos
- evitar alterar arquivos fora do escopo

### Regra especial

Nunca assumir que uma informação não documentada é verdadeira só porque parece lógica.

Quando houver conflito entre documentos, prevalece a documentação mais específica do sistema, e o conflito deve ser registrado para revisão.

---

## Assets

Antes de adicionar assets:

- verificar se já existe versão equivalente
- usar nome consistente
- colocar na pasta correta
- evitar duplicatas
- respeitar formato definido pelo projeto

---

## Código

### Evitar

- arquivos gigantes
- funções com responsabilidades demais
- dependências circulares
- valores mágicos sem explicação
- código duplicado
- lógica de gameplay dentro da UI

### Preferir

- componentes pequenos
- funções reutilizáveis
- estados explícitos
- dados configuráveis
- sistemas desacoplados

---

## Narrativa

Mudanças narrativas precisam respeitar:

- `NARRATIVE_FLOW.md`
- `LORE_BIBLE.md`
- `CHAPTERS.md`
- `ENTITY_DATABASE.md`

Não alterar origem, comportamento ou eventos de uma entidade importante sem atualizar a documentação correspondente.

---

## Performance

Qualquer alteração que possa afetar desempenho deve considerar:

- CPU
- GPU
- memória
- número de entidades ativas
- draw calls
- shaders
- carregamento

Consultar `OPTIMIZATION.md` quando necessário.

---

## Testes

Alterações relevantes devem passar pelo fluxo de `TESTING_QA.md`.

Testar principalmente:

- save/load
- transições de cena
- eventos
- inventário
- IA
- puzzles
- cutscenes
- UI

---

## Segurança

Nunca adicionar ao repositório:

- tokens
- API keys
- senhas
- credenciais
- arquivos privados

Use variáveis de ambiente ou mecanismos seguros quando necessário.

---

## Regra de ouro

**Não basta fazer funcionar. O sistema precisa continuar compreensível depois que funcionar.**

Uma contribuição boa resolve o problema de hoje sem criar o problema de amanhã.
