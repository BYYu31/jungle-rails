const configYargs = require("webpack-cli/bin/config/config-yargs");

describe('home-page', () => {
  it('visit', () => {
    cy.visit('http://localhost:3000')
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it('There should be 12 products', () => {
    cy.get('.products article').should('have.length', 12);
  })
})