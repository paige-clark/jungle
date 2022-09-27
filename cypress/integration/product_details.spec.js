describe('User can navigate from home to a product', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  // first: get the product
  // then click the product
  // the check to see if product info is on the page

  it('should redirect to a product page when you clik on a product', () => {
    cy.get('.products article').should('have.length', 2).first().click();
    cy.url().should('include', '/product');
    cy.contains('Scented Blade')
  });
});
