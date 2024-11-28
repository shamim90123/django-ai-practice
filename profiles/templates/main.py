from bs4 import BeautifulSoup

with open('base.html', 'r') as html_file:
    content = html_file.read()
    soup = BeautifulSoup(content, 'html.parser')
    print(soup.prettify())  # Use soup to parse and manipulate the HTML
