from pybtex.database.input import bibtex

for bib in ['./papers.bib', './works.bib']:
    parser = bibtex.Parser()
    bib_data = parser.parse_file(bib)

    for key, item in bib_data.entries.items():
        doi = item.fields.get('doi')
        doi_item = f'[{doi}]' if doi else ''
        author = item.fields.get('collaboration', 'ATLAS Collaboration' if 'ATLAS' in item.fields.get('author', '') else 'G. Stark et al.')
        author = f'{author} Collaboration' if author == 'ATLAS' else author
        journal = item.fields.get('journal')
        eprint = item.fields.get('eprint', item.fields.get('reportNumber', item.fields.get('howpublished', 'NONE')))
        primary_class = item.fields.get('primaryClass')
        primary_class = f'{{physics.{primary_class}}}' if primary_class else ''

        publication = 'Conf' if 'CONF' in eprint else (
                'Pub' if 'PUB' in eprint else (
                'Int' if 'COM' in eprint else (
                'Proc' if 'PROC' in eprint else '')
            )
        )
        print(f"\Publication{publication}{doi_item}{{{item.fields['title']}}}{{{author}}}{{{journal}}}{{{eprint}}}{primary_class}".replace('{{','{').replace('}}','}'))
    print('-'*20)
