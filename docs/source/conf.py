# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'dotfiles'
copyright = '2024, cjw6k'
author = 'cjw6k'
release = 'latest'
version = 'latest'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinx.ext.duration',
    'sphinx.ext.todo',
    # 'sphinx_rtd_dark_mode',
    'sphinxcontrib.plantuml', # https://github.com/sphinx-contrib/plantuml
]

plantuml = 'java -jar /opt/plantuml/plantuml.jar'

todo_include_todos = True
nitpicky = True
show_warning_types = True

exclude_patterns = []

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

# html_theme = 'sphinx_rtd_theme'
# html_theme_options = {
#     'style_external_links': True,
#     'collapse_navigation': False,
# }

html_theme = 'pyramid'
