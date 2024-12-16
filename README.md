# Johnny Tran's Resume

[![CI main](https://github.com/johnnytran0/resume/actions/workflows/ci-main.yml/badge.svg?branch=main)](https://github.com/johnnytran0/resume/actions/workflows/ci-main.yml)

This GitHub repository automates the customization and compilation of my resume to a PDF using LaTeX and GitHub Actions.

I've maintained my resume in LaTeX since my university days and chose to leverage GitHub Actions to improve its reproducibility and portability.

## Download

📥 Save a copy: [resume-johnny-tran.pdf](https://github.com/johnnytran0/resume/releases/latest/download/resume-johnny-tran.pdf)

<details open>
    <summary>🖼️ Preview </summary>
    <kbd>
        <p align="center">
            <a href="https://docs.google.com/viewer?url=https://github.com/johnnytran0/resume/releases/latest/download/resume-johnny-tran.pdf" target="_blank">
                <img src="https://github.com/johnnytran0/resume/releases/latest/download/resume-johnny-tran.png" alt="Johnny Tran's Resume" width="80%"/>
            </a>
        </p>
    </kbd>
</details>

## Getting Started

Install LaTeX and other platform specific dependencies to compile `tex/resume*.tex` and output a PDF file to `output/resume*.pdf`.

### Setting Up Your Environment

#### Docker

Run containerized via [pandoc/latex](https://hub.docker.com/r/pandoc/latex)

```bash
make docker
```

#### GitHub Actions

* [xu-cheng/latex-action](https://github.com/xu-cheng/latex-action)

#### MacOS

Install dependencies via [Homebrew](https://formulae.brew.sh/formula/texlive)

```bash
make brew && make
```

## Quality

### Lint

```bash
make lint
```

* [super-linter/super-linter](https://github.com/super-linter/super-linter)
    * [ChkTeX](https://www.nongnu.org/chktex/ChkTeX.pdf)
    * [gitleaks/gitleaks](https://github.com/gitleaks/gitleaks)
    * [textlint/textlint](https://github.com/textlint/textlint)
        * [sapegin/textlint-rule-terminology](https://github.com/sapegin/textlint-rule-terminology)

### Writing Assistance

* [Grammarly](https://app.grammarly.com/)
    * [What are the limitations when using Grammarly?](https://support.grammarly.com/hc/en-us/articles/115000090911-What-are-the-limitations-when-using-Grammarly)
        * > Supported document types are Microsoft Word (.doc, .docx), OpenOffice (.odt), .txt, and .rtf.

## Resources

### Job Sites

#### LinkedIn

* [Upload your resume to LinkedIn](https://www.linkedin.com/help/linkedin/answer/a510363)

#### Indeed

* [How To Upload Your Resume to Indeed](https://www.indeed.com/career-advice/resumes-cover-letters/how-to-upload-resume-to-indeed)
    * "Your resume may look good to a human but may not be parsed accurately by the software. See results below of how a standard ATS software interprets your resume."
        * [Instant Resume Report](https://www.indeed.com/career-services/resume-help/automated-report/report)

### Application Tracking Systems (ATS)?

Application Tracking Systems (ATS) are a suite of software tools used by HR, recruiters, and hiring managers to track and manage candidates throughout the talent acquisition pipeline. For the greatest visibilty during the hiring process, prioritize having clear and simple formatting to ensure readability and compatibility.

#### Resume Parser

Resume Parsers are software applications within an ATS that have the capability to extract key information from unstructured candidate resumes in various formats (`*.doc{,x}`, `*.pdf`, etc) and structure it into a standardized and searchable candidate database.

## References

* [jakegut/resume](https://github.com/jakegut/resume)
