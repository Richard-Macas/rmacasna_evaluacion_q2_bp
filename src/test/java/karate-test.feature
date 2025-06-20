@REQ_HU-EQ2 @HU-EQ2 @marvel_characters_api @testuser @Agente2 @E2 @iniciativa_marvel_characters
Feature: Escenarios para Marvel Characters API

  Background:
    * configure ssl = true

  # Obtener todos los personajes
  @id:1 @obtenerPersonajes @solicitudExitosa200
  Scenario: T-API-HU-EQ2-CA01-Obtener todos los personajes exitosamente 200 - karate
    Given url baseUrl
    When method get
    Then status 200
    # And match response == read('classpath:data/testuser/get_characters_200.json')

  # Obtener personaje por ID (exitoso)
  @id:2 @obtenerPersonajePorId @solicitudExitosa200
  Scenario: T-API-HU-EQ2-CA02-Obtener personaje por ID exitosamente 200 - karate
    Given url baseUrl + '/111'
    When method get
    Then status 200
    # And match response == read('classpath:data/testuser/get_character_by_id_200.json')

  # Obtener personaje por ID (no existe)
  @id:3 @obtenerPersonajePorId @noEncontrado404
  Scenario: T-API-HU-EQ2-CA03-Obtener personaje por ID no existe 404 - karate
    Given url baseUrl + '/999'
    When method get
    Then status 404
    # And match response == read('classpath:data/testuser/get_character_by_id_404.json')

  # Crear personaje (exitoso)
  @id:4 @crearPersonaje @solicitudExitosa201
  Scenario: T-API-HU-EQ2-CA04-Crear personaje exitosamente 201 - karate
    Given url baseUrl
    And request read('classpath:data/testuser/create_character_request.json')
    And header Content-Type = 'application/json'
    When method post
    Then status 201
    # And match response == read('classpath:data/testuser/create_character_201.json')

  # Crear personaje (nombre duplicado)
  @id:5 @crearPersonaje @nombreDuplicado400
  Scenario: T-API-HU-EQ2-CA05-Crear personaje nombre duplicado 400 - karate
    Given url baseUrl
    And request read('classpath:data/testuser/create_character_duplicate_request.json')
    And header Content-Type = 'application/json'
    When method post
    Then status 400
    # And match response == read('classpath:data/testuser/create_character_duplicate_400.json')

  # Crear personaje (faltan campos requeridos)
  @id:6 @crearPersonaje @faltanCampos400
  Scenario: T-API-HU-EQ2-CA06-Crear personaje faltan campos requeridos 400 - karate
    Given url baseUrl
    And request read('classpath:data/testuser/create_character_missing_fields_request.json')
    And header Content-Type = 'application/json'
    When method post
    Then status 400
    # And match response == read('classpath:data/testuser/create_character_missing_fields_400.json')

  # Actualizar personaje (exitoso)
  @id:7 @actualizarPersonaje @solicitudExitosa200
  Scenario: T-API-HU-EQ2-CA07-Actualizar personaje exitosamente 200 - karate
    Given url baseUrl + '/111'
    And request read('classpath:data/testuser/update_character_request.json')
    And header Content-Type = 'application/json'
    When method put
    Then status 200
    # And match response == read('classpath:data/testuser/update_character_200.json')

  # Actualizar personaje (no existe)
  @id:8 @actualizarPersonaje @noEncontrado404
  Scenario: T-API-HU-EQ2-CA08-Actualizar personaje no existe 404 - karate
    Given url baseUrl + '/999'
    And request read('classpath:data/testuser/update_character_request.json')
    And header Content-Type = 'application/json'
    When method put
    Then status 404
    # And match response == read('classpath:data/testuser/update_character_404.json')

  # Eliminar personaje (exitoso)
  @id:9 @eliminarPersonaje @solicitudExitosa204
  Scenario: T-API-HU-EQ2-CA09-Eliminar personaje exitosamente 204 - karate
    Given url baseUrl + '/2515'
    When method delete
    Then status 204
    # And match response == read('classpath:data/testuser/delete_character_204.json')

  # Eliminar personaje (no existe)
  @id:10 @eliminarPersonaje @noEncontrado404
  Scenario: T-API-HU-EQ2-CA10-Eliminar personaje no existe 404 - karate
    Given url baseUrl + '/999'
    When method delete
    Then status 404
    # And match response == read('classpath:data/testuser/delete_character_404.json')
