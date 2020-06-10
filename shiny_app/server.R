#Server side

function(input, output, session) {
  
  # For debugging
  # observeEvent(input$browser, browser())
  
  ###############################################.
  ## Functions 
  # Sourcing file with functions code
  source(file.path("functions_server.R"),  local = TRUE)$value
  
  ###############################################.
  # Summary trends tab  
  source(file.path("summary_tab.R"),  local = TRUE)$value
  
  ###############################################.
  # Commentary tab  
  source(file.path("commentary_tab.R"),  local = TRUE)$value
  
  ###############################################.
  ## Cardiovascular tab
  source(file.path("cardio_tab.R"),  local = TRUE)$value
  
  ###############################################.
  ## Immunisation tab
  source(file.path("immunisation_tab.R"),  local = TRUE)$value
  
  ###############################################.
  ## Child Health tab
  source(file.path("child_health_tab.R"),  local = TRUE)$value
  
  ###############################################.
  ## Data tab
  source(file.path("data_tab.R"),  local = TRUE)$value
  
  ###############################################.
  ## App navigation to move around tabs  
  
  #Table of content for commentary page
  output$commentary_content <- renderText({
    "<br><span id='commentary_TOC'>
    <p>Use the links below to jump to a particular section of commentary</p>     
    <a href='#anchor0306_summary'>3rd June 2020: Summary of trends</a><br>
    <a href='#anchor0606_immune'>3rd June 2020: Immunisations</a><br>
    <a href='#anchor2006_chreviews'>10th June 2020: Child health reviews</a><br>
    </span><br>
    "
  })
  
  observeEvent(input$jump_commentary, {
    updateTabsetPanel(session, "intabset", selected = "comment")
  })
  
  observeEvent(input$jump_summary, {
    updateTabsetPanel(session, "intabset", selected = "summary")
  })
  
  observeEvent(input$jump_table, {
    updateTabsetPanel(session, "intabset", selected = "table")
    
  })
  
  observeEvent(input$jump_immunisation, {
    updateTabsetPanel(session, "intabset", selected = "child")
  })
  
  observeEvent(input$jump_childhealth, {
    updateTabsetPanel(session, "intabset", selected = "child_health")
  })  
    
  
} # server end