Feature: Exchange rate data in real-time for all available currencies or for a specific set

  Scenario Outline: Exchange Rates Rest Api GET /latest
    Given Given to "<url>" "<token>"
    When Get Call to "<url>"
    Then Response Code "<responseCode>" is validated

    Examples:
      | url                                                | responseCode | token                            |  |
      | https://api.apilayer.com/exchangerates_data/latest | 200          | ToLtq1nVDirlrMevFNOUjdJEXTzLFPd5 |  |

  Scenario Outline: Exchange Rates Rest Api GET /latest with wrong token
    Given Given to "<url>" "<token>"
    When Get Call to "<url>"
    Then Response Code "<responseCode>" is validated

    Examples:
      | url                                                | responseCode | token |  |
      | https://api.apilayer.com/exchangerates_data/latest | 401          |       |  |

  Scenario Outline: Exchange Rates Rest Api GET /latests
    Given Given to "<url>" "<token>"
    When Get Call to "<url>"
    Then Response Code "<responseCode>" is validated

    Examples:
      | url                                                 | responseCode | token                            |  |
      | https://api.apilayer.com/exchangerates_data/latests | 400          | ToLtq1nVDirlrMevFNOUjdJEXTzLFPd5 |  |

  Scenario Outline: Exchange Rates Rest Api POST /latest
    Given Given to "<url>" "<token>"
    When Post Call to "<url>"
    Then Response Code "<responseCode>" is validated

    Examples:
      | url                                                 | responseCode | token                            |  |
      | https://api.apilayer.com/exchangerates_data/latests | 403          | ToLtq1nVDirlrMevFNOUjdJEXTzLFPd5 |  |

  Scenario Outline: Exchange Rates Rest Api PUT /latest
    Given Given to "<url>" "<token>"
    When Put Call to "<url>"
    Then Response Code "<responseCode>" is validated

    Examples:
      | url                                                 | responseCode | token                            |  |
      | https://api.apilayer.com/exchangerates_data/latests | 404          | ToLtq1nVDirlrMevFNOUjdJEXTzLFPd5 |  |

  Scenario Outline: Exchange Rates Rest Api GET /latest?symbols=EUR%2CGBP&base=PLN
    Given Given to "<url>" "<token>"
    When Get Call to "<url>"
    Then Response Code "<responseCode>" is validated
    Then Response body has "<base>" and "<rate>"

    Examples:
      | url                                                                           | responseCode | token                            | base | rate    |  |
      | https://api.apilayer.com/exchangerates_data/latest?symbols=EUR%2CGBP&base=PLN | 200          | ToLtq1nVDirlrMevFNOUjdJEXTzLFPd5 | PLN  | GBP,EUR |  |


  Scenario Outline: Exchange Rates Rest Api GET /latest?symbols=GBP&base=PLN
    Given Given to "<url>" "<token>"
    When Get Call to "<url>"
    Then Response Code "<responseCode>" is validated
    Then Response body has "<base>" and "<rate>"

    Examples:
      | url                                                                           | responseCode | token                            | base | rate |  |
      | https://api.apilayer.com/exchangerates_data/latest?symbols=EUR%2CGBP&base=PLN | 200          | ToLtq1nVDirlrMevFNOUjdJEXTzLFPd5 | PLN  | GBP  |  |