Feature: Test de API súper simple

  Background:
    * configure ssl = true

  Scenario: Verificar que un endpoint público responde 200
    Given url 'https://jsonplaceholder.typicode.com/posts/1'
    When method get
    Then status 200
