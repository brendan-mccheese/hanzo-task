
describe("Test app", () => {
    it("works", () => {
        cy.visit(Cypress.env("APP_URL") || "http://localhost:8080");
        cy.get("[data-e2e-id='api-title']", {timeout: 10000});
    });
});