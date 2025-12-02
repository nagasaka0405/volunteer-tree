# Pin npm packages by running ./bin/importmap

pin "application"
pin "star-rating"

# Bootstrap の ES Modules 版を pin
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js"

# Popper.js の ES Modules 版を pin
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/dist/esm/popper.js"