describe('User can navigate from home to a product', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  /*
  Write a new feature spec that will test that users can click the
  'Add to Cart' button for a product on the home page and in doing
  so their cart increases by one.
  */
  // first check to see if there are two products on the page
  it('There are 2 products on the page', () => {
    cy.get('.products article').should('have.length', 2);
  });
  // first check to see if there are two products on the page
  it('should increment the cart by one when you click add on a product', () => {
    cy.get('.products article:first button')
      .should('contain.text', 'Add')
      .click({ force: true });
    cy.get('nav')
      .should('contain.text', 'My Cart (1)')
    
  });
});
