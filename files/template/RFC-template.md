---
# Don't change this header section
title: "[RFC Title]"
subtitle: "Time Machine [RFC-id]"
author:
  - Author 1
header-includes:
  - \usepackage{fancyhdr}
  - \pagestyle{fancy}
  - \fancyhead[R]{}
  - \fancyfoot[L]{-release-version-}
output: pdf_document
---

# Motivation

This file is the template to be used for new RFCs. It is intended to be both a
starting point for new RFCs and an example of what can be achieved within the
limits of a markdown file.

# File structure

## YAML-Header

To aid the generation of the final release-PDF-files, this markdown file
contains a header in the `YAML`-format[^yaml]. Apart from other things it states
the RFC-title and subtitle as well as information about the authors of the RFC.

Please keep the header exactly as-is, its contents will be modified by the
RFC-Editorial Team.

## Sections

An RFC document should always contain the YAML header, a _Motivation_ section
directly below the header as the first section in the document, as many
author-defined sections as necessary as the main content, a _questions and
answers_-section (_Q&A_) and the footnotes at the bottom of the document.
Writers can delete the pre-existing section structure (with the exception of the
motivation and q&a sections) in this file and add new sections as they see fit.

The _Motivation_ section is intended to show the general reason for the writing
of the RFC. It should be concise.

The _Q&A_ section is intended to provide a view on the RFC from a different
angle than the one of a traditional paper on a subject. It gives RFC writers the
possibility to test their main structures, methods and drawbacks from the point
of view of outside readers of the document. It should follow the general form
outlined below in the q&a section of this template file.

# TM Glossary

Terms that are of special significance to the Time Machine must be written in
**bold** on their first usage in an RFC document. Definitions and important
terms are listed in _RFC-0001 on RFC Glossary_.

# Markdown

It is allowed to use the whole range of markdown features as well as everything
supported by Pandoc out of the box. A good overview and introduction can be
found in the markdown specification itself[^daring_markdown] and the Pandoc user
documentation[^pandoc_markdown].

## Hyperlinks

RFCs are released as PDF documents. While it is possible to set hyperlinks in
markdown that will also work in PDF documents it is advised to add the actual
links in footnotes. This way they can be easily read. Footnotes (similar to the
one in the previous paragraph can be created by adding `[^footnote_name]` where
the footnote is to be placed and `[^footnote_name]: Content of the footnote` at
the end of this file. Only alphanumeric characters and underscores are allowed.
Hyperlinks in footnotes should be added in angled brackets:
`<http://example.com>`.

## Tables

It is possible to use the different ways to create table using Pandoc
markdown[^pandoc_tables]. The following example uses the simple syntax:

| Column 1 | Column 2 | Column 3 |
| -------- | -------- | -------- |
| Foo      | Bar      | Baz      |
| Alpha    | Beta     | Gamma    |

Table: Demonstration of simple table syntax.

## Images

It is possible to include images. They should be added in an `images` folder
directly next to the markdown document. In the text they are referenced like
this: `![Image caption](./images/image_name_including_file_ending.png)`. The
path is relative to the location of the markdown file.

# Q&A

## Question: Am I allowed to modify the YAML header on top of the file?

No, the header is aimed at the creation of the release PDF files and should only
be changed by the RFC-Editorial Team.

## Question: Can I omit the Motivation or Q&A sections?

No, both sections are important for reviewers and implementers to understand the
direction of the RFC, it's motivation and possibly problematic points /
implications for other parts of the Time Machine.

## Question: Why doesn't my file look the same in my editor, the GitHub repository and the PDF files?

The PDF files are created by an automated process using _Pandoc_[^pandoc], a
tool to convert between different text formats. It provides more extensive
capabilities for text structuring and formatting (for instance footnotes). This
additional parts are not understood by the GitHub markdown parser and might be
previewed differently by various markdown editors.

## Question: Where can I preview how my RFC document will look at the end?

If you have started your document by forking the official GitHub RFC
repository[^rfc_repo] you can see the current version of the RFC drafts in the
_Action_ section of your own GitHub RFC repository[^github_manage_action] after
you pushed a change to it.

<!-- Footnote area: Please keep the list of footnotes sorted alphabetically to simplify managing them -->

[^daring_markdown]: <https://daringfireball.net/projects/markdown/basics>
[^github_manage_action]:
    <https://help.github.com/en/actions/configuring-and-managing-workflows/managing-a-workflow-run#viewing-your-workflow-history>

[^pandoc]: <https://pandoc.org/>
[^pandoc_markdown]: <https://pandoc.org/MANUAL.html#pandocs-markdown>
[^pandoc_tables]: <https://pandoc.org/MANUAL.html#tables>
[^rfc_repo]: <https://github.com/time-machine-project/requests-for-comments>
[^yaml]: <https://en.wikipedia.org/wiki/YAML>
