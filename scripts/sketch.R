library(tidyverse)
library(tidytext)


session <- session_feedback_uwresearchbazaar2023_2023_11_14_xlsx_responses |>
    mutate(rating = NULL,
           start = NULL,
           `saved at` = NULL,
           id = NULL,
           speakers = NULL,
           email = str_remove(email, "@wisc.edu"),
           email = str_remove(email, "@cs.wisc.edu"),
           email = str_remove(email, "@storm-gps.us"),
           email = str_remove(email, "@gmail.com"),
           email = str_remove(email, "@sonicfoundry.com"))

presenters <- Copy_of_2023_Research_Bazaar_Presenter_Survey_Responses_Form_Responses_1 |>
    select(`Is there anything else you would like the conference organizers to know?`,
           `What is something that you think could be improved in the future for Research Bazaar presenters?`,
           `What's one thing that went well or that you really liked about presenting at the Research Bazaar?`)

post_event <- post_events |> select(starts_with("how satisfied"),
                                     starts_with("what"),
                                     starts_with("if"),
                                     starts_with("Affiliation"),
                                     `Gender identity`,
                                     `Race and Ethnicty`,
                                     `Do you identify as transgender?`)

feedback$feedback |>
    na.omit() |>
    unnest_tokens(feedback, words) |>
    anti_join(stop_words)
