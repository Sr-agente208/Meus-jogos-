# OPTIMIZATION.md

## Objetivo

Este documento define as diretrizes de otimização e performance do jogo.

A meta é manter uma experiência estável sem sacrificar atmosfera, qualidade visual ou complexidade de gameplay.

---

## Princípios

- Medir antes de otimizar.
- Corrigir gargalos reais.
- Evitar micro-otimizações prematuras.
- Priorizar estabilidade sobre efeitos desnecessários.
- Toda otimização deve preservar comportamento e qualidade.

---

## Metas de performance

As metas finais dependem da plataforma, mas o projeto deve buscar:

- frame time estável
- pouca variação de FPS
- carregamentos previsíveis
- uso controlado de memória
- ausência de stutter perceptível

### Regra
Uma média alta de FPS não é suficiente se houver travamentos frequentes.

---

## Ordem de investigação

Quando houver problema de performance:

1. reproduzir o problema
2. medir
3. identificar o gargalo
4. aplicar a menor correção necessária
5. medir novamente
6. testar regressão

---

## CPU

### Fontes comuns de custo
- IA executada a cada frame
- excesso de física
- loops grandes
- busca repetida por nós ou objetos
- eventos duplicados
- sistemas atualizando quando estão fora da área do jogador

### Boas práticas
- reduzir frequência de atualização quando possível
- cachear referências
- usar sinais/eventos em vez de polling quando adequado
- desativar sistemas de áreas distantes
- evitar processamento desnecessário em `_process` ou equivalente

---

## IA e inimigos

A IA pode ser uma das maiores fontes de custo.

### Regras
- inimigos distantes podem atualizar em frequência menor
- sensores devem ter intervalos configuráveis
- pathfinding não deve ser recalculado sem necessidade
- entidades inativas não devem consumir CPU continuamente

### LOD lógico
- perto: comportamento completo
- médio: comportamento simplificado
- longe: atualização mínima ou desativada

---

## GPU e renderização

### Fontes comuns
- muitos efeitos de tela
- materiais caros
- transparência excessiva
- partículas em excesso
- sombras muito pesadas
- pós-processamento acumulado

### Regras
- usar efeitos apenas quando trazem valor visual
- evitar múltiplos passes caros sem necessidade
- revisar partículas e transparências em cenas densas
- reduzir efeitos em hardware mais fraco

---

## Shaders

Relacionar este documento com `SHADER_GUIDE.md`.

### Regras
- preferir shaders simples para efeitos frequentes
- evitar cálculos pesados por pixel sem necessidade
- controlar resolução de efeitos de pós-processamento
- não aplicar glitch global o tempo inteiro
- desligar efeitos quando não estiverem em uso

---

## Memória

### Objetivos
- evitar vazamentos
- evitar carregar assets inutilmente
- liberar recursos de áreas antigas
- manter tamanhos de textura sob controle

### Regras
- não manter assets pesados em memória sem necessidade
- descarregar recursos quando seguro
- monitorar uso de memória durante troca de capítulos
- evitar duplicação de recursos

---

## Texturas e materiais

### Regras
- usar resolução adequada ao tamanho na tela
- evitar texturas enormes para objetos pequenos
- comprimir quando apropriado
- reutilizar materiais quando possível

### Mipmap
Usar quando fizer sentido para reduzir aliasing e custo visual em distância.

---

## Áudio

### Otimização
- evitar carregar tudo na memória
- usar streaming para arquivos longos quando apropriado
- reutilizar efeitos comuns
- limitar sons simultâneos quando necessário

---

## Carregamento

### Estratégias
- loading por capítulo
- carregamento assíncrono quando suportado
- pré-carregamento somente do necessário
- descarregamento de áreas antigas

### Regra
A transição entre áreas deve ser planejada desde o level design.

---

## Streaming e áreas

Mapas grandes devem ser divididos em regiões.

### Possível estrutura
- área atual: prioridade máxima
- área adjacente: pré-carregada
- área distante: descarregada ou simplificada

---

## UI

### Regras
- não atualizar elementos visuais a cada frame sem necessidade
- evitar animações excessivas
- atualizar somente quando o dado mudar

---

## Partículas e efeitos

### Controle
- limitar quantidade máxima
- reduzir emissão em hardware fraco
- desligar partículas fora da câmera
- reutilizar sistemas quando possível

---

## Física

### Regras
- limitar corpos físicos ativos
- evitar colisores complexos desnecessários
- desativar física de objetos distantes quando seguro
- evitar interações físicas para objetos puramente decorativos

---

## Save e carregamento

O sistema de save também precisa ser eficiente.

### Regras
- salvar somente dados necessários
- evitar serialização gigante
- não salvar continuamente sem motivo
- fazer validação sem bloquear a gameplay quando possível

---

## Performance por plataforma

A implementação deve permitir perfis diferentes.

### Perfil baixo
- efeitos reduzidos
- sombras menores
- menor distância de visão
- partículas reduzidas
- pós-processamento limitado

### Perfil médio
- qualidade equilibrada

### Perfil alto
- maior qualidade visual
- efeitos completos
- distância de visão maior

---

## Ferramentas de profiling

Durante desenvolvimento, usar ferramentas de profiling para medir:

- CPU
- GPU
- memória
- draw calls
- física
- IA
- carregamento

O nome da ferramenta depende da engine utilizada.

---

## Critérios de regressão

Toda mudança relevante deve verificar:

- FPS
- frame time
- memória
- carregamento
- comportamento de IA
- estabilidade do save

Uma otimização que cria bug não é otimização válida.

---

## Checklist

Antes de considerar uma área otimizada:

- O problema foi medido?
- O gargalo foi identificado?
- A correção foi testada?
- O FPS está estável?
- A memória está controlada?
- Os efeitos continuam visualmente bons?
- A gameplay continua igual?

---

## Regra final

Performance boa é aquela que o jogador não percebe.

O ideal é que o jogador perceba o terror, a narrativa e o mundo — não o garbage collector, o stutter ou a GPU implorando por misericórdia.
