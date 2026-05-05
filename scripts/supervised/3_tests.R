# Response vs recurrence
table_response <- table(thyroid$response, thyroid$recurred)
table_response
chisq.test(table_response)

# Risk vs recurrence
table_risk <- table(thyroid$risk, thyroid$recurred)
table_risk
chisq.test(table_risk)

# Stage vs recurrence
table_stage <- table(thyroid$stage, thyroid$recurred)
table_stage
chisq.test(table_stage)

# Adenopathy vs recurrence
table_adenopathy <- table(thyroid$adenopathy, thyroid$recurred)
table_adenopathy
chisq.test(table_adenopathy)

# Age vs recurrence
t.test(age ~ recurred, data = thyroid)