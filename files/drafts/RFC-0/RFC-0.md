---
title:  'RFC-0'
subtitle: 'RFC on RFCs'
author:
- Andreas Maier
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

+ Drafts are stored in the `files/drafts` folder, candidates in the `files/candidates` and published RFCs in the `files/releases/` folder.

+ During candidate merging and final publication, all documents that are in the candidate stage or published up to this point in time are converted into PDF documents, amended with the time of conversion and the release number and stored in the form of a GitHub *Release*[^github_release] with all documents attached to a candidates and a releases zip file.

## Workflow description

1. The RFC team is appointed by the Time Machine Organisation Board. Proposals to form an RFC Team to create a new RFC or  update an existing RFC can be done to the Time Machine Organization at any time.
2. The RFC team prepares an initial version for a new RFC.
3. It is published in a new draft document in the [`files/drafts`](files/drafts) folder on a new branch that follows the naming scheme `[rfc-number]_draft` in the official repository (=*here*).
4. Public *pull requests*[^github_pullrequest] and comments as well as feedback via GitHub *issues*[^github_issues] will be open for a set amount of time to give the community the opportunity to discuss the RFC and contribute to the final text. Pull requests modifying the draft can be merged by the RFC team after favourable reviews by at least 4 reviewers.
5. After the drafting period is finished and all open pull requests have been either merged or closed the draft document is moved to the [`files/candidate`](files/candidate) folder and merged in a new branch that follows the naming scheme `[rfc-number]_candidate`. This triggers the creation of a candidate GitHub release (not to be confused with the final public release of a finished RFC) and the conversion and publishing of PDF files as attachments to the release.
6. The release candidate will be submitted to *openreview.net*[^openreview_timemachine] for open and public peer-review to the scientific community. We suggest this step in addition to Step 4, to enable scientists to provide feedback that have less technical background and are challenged by the using specialised tools such as GitHub and Markdown. This review step shall be concluded after rigorous peer-review to ensure the scientific rigor of the work and may also lead to a rejection of the RFC. Decisions are to be found within the time frame of 3 months. The reviewers for each RFC are selected by the TM team which is appointed by the TMO Board. Once the RFC is posted on openreview.net reviewers may also actively approach the TM team if they are eager to review the RFC. Reviewers, however, need to be free of conflict of interest and may not have contributed to the RFC themselves as member of the RFC team or author of the RFC.
7. Successful RFCs are moved from `files/candidates` to `files/releases` and the candidate branch will be merged into a release branch named `[rfc-number]_release`. This will again trigger the creation of a GitHub release and the conversion of the documents into PDF files.
8. Finally, the finished release branch will be merged back into master to prepare for new RFCs.

[^wiki_rfc]: <https://en.wikipedia.org/wiki/Request_for_Comments>
[^github_forking]: <https://guides.github.com/activities/forking/>
[^bitbucket_forking]: <https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow>
[^orig_markdown_syntax]: <https://daringfireball.net/projects/markdown/syntax>
[^pandoc_markdown]: <https://pandoc.org/MANUAL.html#pandocs-markdown>
[^github_release]: <https://help.github.com/en/github/administering-a-repository/about-releases>
[^github_pullrequest]: <https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests>
[^github_issues]: <https://guides.github.com/features/issues/>
[^openreview_timemachine]: <https://openreview.net/group?id=TimeMachine.eu/RFC>
