Feature: Preconditions for boards api tests

  Scenario: Create board, get list and create one card.
    * url 'https://api.trello.com/1/'
    * def boardNameRandom = 'adeBoardKarate';
    * def listNameRandom = 'adeListKarate';
    * def cardNameRandom = 'adeCardKarate';
    * def cardNameRandom2 = 'adeCardKarate2';

    Given path 'boards'
    And form field name = boardNameRandom
    And form field key = 'ba510fa50e0070fb70e629a6526e460b'
    And form field token = '3286f41172d51526afe89a2dab31be4ccc760618f4ec97618be70bddc2aebd93'
    * print url
    When method post
    Then status 200
    And print response
    * def json = response
    * def idCreatedBoard = get json.id

    Given path 'boards/' + idCreatedBoard + '/lists'
    And form field name = listNameRandom
    And form field key = 'ba510fa50e0070fb70e629a6526e460b'
    And form field token = '3286f41172d51526afe89a2dab31be4ccc760618f4ec97618be70bddc2aebd93'
    * print url
    When method post
    Then status 200
    And print response
    * def json = response
    * def idCreatedList = get json.id


    Given path 'cards/'
    And form field name = cardNameRandom
    And form field idList = idCreatedList
    And form field key = 'ba510fa50e0070fb70e629a6526e460b'
    And form field token = '3286f41172d51526afe89a2dab31be4ccc760618f4ec97618be70bddc2aebd93'
    When method post
    Then status 200
    And print response
    * def resBody = response
    * def idCreatedCard = get resBody.id

    Given path 'cards/'
    And form field name = cardNameRandom2
    And form field idList = idCreatedList
    And form field key = 'ba510fa50e0070fb70e629a6526e460b'
    And form field token = '3286f41172d51526afe89a2dab31be4ccc760618f4ec97618be70bddc2aebd93'
    When method post
    Then status 200
    And print response
    * def resBody2 = response
    * def idCreatedCard2 = get resBody2.id

    Given path 'cards/' + idCreatedCard
    And form field key = 'ba510fa50e0070fb70e629a6526e460b'
    And form field token = '3286f41172d51526afe89a2dab31be4ccc760618f4ec97618be70bddc2aebd93'
    When method delete
    Then status 200

    Given path 'cards/' + idCreatedCard2
    And form field key = 'ba510fa50e0070fb70e629a6526e460b'
    And form field token = '3286f41172d51526afe89a2dab31be4ccc760618f4ec97618be70bddc2aebd93'
    When method delete
    Then status 200

    Given path 'boards/' + idCreatedBoard
    And form field key = 'ba510fa50e0070fb70e629a6526e460b'
    And form field token = '3286f41172d51526afe89a2dab31be4ccc760618f4ec97618be70bddc2aebd93'
    When method delete
    Then status 200


