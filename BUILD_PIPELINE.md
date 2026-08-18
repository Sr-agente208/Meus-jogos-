# BUILD_PIPELINE.md

## Objetivo

Este documento define o fluxo de build, teste e exportação do jogo.

A meta é garantir que cada versão possa ser reproduzida, testada e identificada sem depender de ajustes manuais escondidos.

---

## Princípios

- Builds devem ser reproduzíveis.
- Toda build precisa ter versão identificável.
- Não exportar diretamente do estado de desenvolvimento sem validação.
- Testes críticos devem acontecer antes da release.
- Artefatos finais devem ficar separados dos arquivos-fonte.

---

## Ambientes

### Development
Uso diário durante implementação.

Características:
- debug ativo
- logs detalhados
- ferramentas de teste disponíveis
- conteúdo experimental permitido

### Testing
Uso para QA e validação.

Características:
- comportamento próximo da release
- ferramentas de diagnóstico controladas
- dados de teste conhecidos

### Release
Versão destinada ao jogador.

Características:
- sem ferramentas internas desnecessárias
- logs reduzidos
- configurações finais
- assets finais

---

## Fluxo padrão

```text
Alteração
   ↓
Commit
   ↓
Build de desenvolvimento
   ↓
Teste rápido
   ↓
Build de teste
   ↓
QA
   ↓
Correções
   ↓
Release Candidate
   ↓
QA final
   ↓
Build final
```

---

## Versionamento

Usar versão semântica sempre que possível:

```text
MAJOR.MINOR.PATCH
```

Exemplo:

```text
0.1.0
0.1.1
1.0.0
```

### Interpretação
- **MAJOR**: mudança grande ou incompatível.
- **MINOR**: nova funcionalidade.
- **PATCH**: correção.

---

## Identificação da build

Toda build deve registrar:

- versão do jogo
- data da build
- plataforma
- commit usado
- configuração utilizada

Exemplo:

```text
Game: Mundo Torajo
Version: 0.4.0
Platform: Windows
Commit: abc1234
Build: Release
```

---

## Plataformas

Quando suportadas pelo motor escolhido:

- Windows
- Linux
- Android
- Web
- outras plataformas futuras

Cada plataforma deve possuir configuração própria quando necessário.

---

## Configuração de build

A configuração precisa separar:

- nome do produto
- versão
- ícone
- resolução padrão
- modo de janela
- arquivos incluídos
- backend gráfico
- opções de debug

---

## Assets

Antes da build final:

- verificar arquivos ausentes
- verificar referências quebradas
- remover assets não utilizados quando seguro
- validar formatos
- confirmar caminhos

### Regra
Nenhum asset crítico deve depender de caminho absoluto da máquina do desenvolvedor.

---

## Dependências

Registrar:

- motor do jogo
- versão do motor
- plugins
- bibliotecas externas
- ferramentas auxiliares

A versão exata deve ser registrada quando houver risco de incompatibilidade.

---

## Build automatizada

Quando possível, usar CI/CD.

### Pipeline recomendado

1. Checkout do commit.
2. Instalação das dependências.
3. Validação do projeto.
4. Execução de testes automatizados.
5. Build.
6. Empacotamento.
7. Publicação do artefato.

---

## Artefatos

Separar:

```text
builds/
├── dev/
├── test/
├── release/
└── archive/
```

### Regras
- Não versionar builds gigantescas sem necessidade.
- Usar Releases ou artifacts do CI quando possível.
- Nomear arquivos com versão e plataforma.

Exemplo:

```text
mundo-torajo-v0.4.0-windows.zip
```

---

## Release Candidate

Antes da release final:

- congelar novas funcionalidades
- corrigir bugs críticos
- executar regressão
- verificar save/load
- verificar áudio
- verificar UI
- verificar capítulos
- verificar bosses
- verificar desempenho

---

## Checklist de build

- [ ] Projeto abre sem erro.
- [ ] Todas as cenas principais carregam.
- [ ] Não existem assets críticos faltando.
- [ ] Save e load funcionam.
- [ ] Áudio funciona.
- [ ] UI funciona.
- [ ] IA funciona.
- [ ] Puzzles funcionam.
- [ ] Capítulos podem ser concluídos.
- [ ] Bosses podem ser enfrentados e concluídos.
- [ ] Nenhum bug crítico conhecido permanece.

---

## Pós-build

Depois da exportação:

1. Instalar a build em ambiente limpo.
2. Iniciar um novo jogo.
3. Testar carregamento de save.
4. Testar progressão básica.
5. Confirmar informações de versão.
6. Registrar resultado do QA.

---

## Rollback

Toda release precisa permitir retorno à versão anterior.

Guardar:
- build anterior
- commit anterior
- notas da release
- mudanças conhecidas

Nunca substituir a última versão estável sem manter uma cópia recuperável.

---

## Relação com Git

Cada build de release deve apontar para um commit específico.

### Recomendação

```text
git tag v0.4.0
```

O código da release deve permanecer rastreável pelo histórico do Git.

---

## Regra final

Uma build não é considerada pronta só porque exportou sem erro.

Ela está pronta quando:

**compilou + abriu + foi testada + pode ser identificada + pode ser recuperada.**
