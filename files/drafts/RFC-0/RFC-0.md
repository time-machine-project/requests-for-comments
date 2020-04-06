---
title:  'RFC-0'
subtitle: 'RFC on RFCs'
author:
- Daniel Jeller
header-includes:
- \usepackage{fancyhdr}
- \pagestyle{fancy}
- \fancyfoot[L]{-release-version-}
output: pdf_document
---

# Motivation

Reaching consensus on the technology options to follow in a programme as large as Time Machine is a complex issue. To ensure the open development and evaluation of work, a process inspired by the Request for Comments (RFC) that was used for the development of the Internet protocol[^wiki_rfc] will be adapted to the needs of Time Machine. Time Machine Requests for Comments will be freely accessible publications, identified with a unique ID, constituting the main process for establishing rules, recommendations, core architectural choices for the Time Machine components. Their basic principles are:

+ *Accessibility* – TM RFC are freely accessible, free of charge.
+ *Openness* – Anybody can write a TM RFC.
+ *Identification* – Each TM RFC, once published, has a unique ID and no changes are allowed after publication. Any important changes result in a subsequent TM RFC. For this reason, some TM RFCs could be tagged as obsolete.
+ *Incrementalism* – Each TM RFC should be useful for its own right and act as a building block to others. Each TM RFC must be aimed as a contribution, extension or revision of the TM infrastructure.
+ *Standardisation and linguistic diversity* – TM RFCs should aim to make use of standardised terms to improve the clarity level of its recommendation but can be written in any language. Once published they should be translated in a maximum number of language.
+ *Scope* – TM RFCs are designed contribution and implementation solutions solving practical problems. TM RFC are not research papers and may not necessarily contain experimental evidence.
+ *Self-defining process* – Like for the development of the Internet, TM RFC could be the main process for establishing TM Rules, TM Recommendations, TM Standard Metrics but also the processes and roles for managing TM RFCs themselves

# Proposed workflow

The Request for comments workflow is inspired by *forking*[^github_forking], a workflow, that "is most often seen in public open source projects"[^bitbucket_forking].

## Preliminary notes

+ The drafted and released RFCs are written in the extended *Markdown*[^orig_markdown_syntax] syntax used by *Pandoc*[^pandoc_markdown], a tool to convert texts between different formats.

+ The drafting process takes place on the *master* branch of the main RFC repository.

+ Documents are prepared in directories and files named after the RFC number, for example `RFC-0/RFC-0.md`.

+ Drafts are stored in the `files/drafts` folder, on publication they are moved to `files/releases/`.

+ During publication, all documents that are published up to this point in time are converted into PDF documents, amended with the time of conversion and the release number and stored in the form of a GitHub *Release*[^github_release] with all documents attached as a single zip archive.

## Workflow description

1. The TM team prepares an initial version for a new RFC

2. It is published in a new draft document in the [files/drafts](files/drafts) folder using a new feature branch in the official repository (=*here*).

3. Public *pull requests*[^github_pullrequest] and comments as well as feedback via GitHub *issues*[^github_issues] will be open for a set amount of time to give the community the opportunity to discuss the RFC and contribute to the final text. Pull requests can be merged by the TM team after favourable reviews by at least 4 reviewers.

4. After the drafting period has passed, the draft file will be moved from `files/drafts` to `files/releases` and the release version will be prepared. For this, the list of authors in the draft document will be updated to contain all persons that contributed to the release.

5. The master branch will be merged into a release branch named `[RFC-id]_release` and on merging an automated script will create the github release as well as the compressed archive file containing all published RFC releases as PDF documents.

[^wiki_rfc]: <https://en.wikipedia.org/wiki/Request_for_Comments>
[^github_forking]: <https://guides.github.com/activities/forking/>
[^bitbucket_forking]: <https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow>
[^orig_markdown_syntax]: <https://daringfireball.net/projects/markdown/syntax>
[^pandoc_markdown]: <https://pandoc.org/MANUAL.html#pandocs-markdown>
[^github_release]: <https://help.github.com/en/github/administering-a-repository/about-releases>
[^github_pullrequest]: <https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests>
[^github_issues]: <https://guides.github.com/features/issues/>