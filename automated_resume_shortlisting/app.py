import streamlit as st
import pandas as pd
from resume_processor import process_resume
from job_matcher import calculate_match_score
import os

st.title("Automated Resume Shortlisting System")

# Upload resumes
uploaded_files = st.file_uploader("Upload Multiple Resumes (PDF or DOCX)", type=["pdf", "docx"], accept_multiple_files=True)

# Job Descriptions - one per resume
job_descriptions = []
if uploaded_files:
    st.subheader("Enter Job Descriptions for Each Resume")
    for i, file in enumerate(uploaded_files):
        jd = st.text_area(f"Job Description for Resume {i+1} ({file.name})", height=150)
        job_descriptions.append(jd)

# Shortlisting Button
if st.button("Shortlist Candidates"):
    if len(uploaded_files) != len(job_descriptions):
        st.warning("Please provide a job description for each resume.")
    else:
        results = []

        for i, file in enumerate(uploaded_files):
            resume_text = process_resume(file)
            job_desc = job_descriptions[i]
            score = calculate_match_score(resume_text, job_desc)
            results.append({
                "Candidate Name": os.path.splitext(file.name)[0],
                "Resume File": file.name,
                "Match Score (%)": score
            })

        # Create and display the table
        df_results = pd.DataFrame(results).sort_values(by="Match Score (%)", ascending=False).reset_index(drop=True)
        st.subheader("Shortlisted Resume Scores")
        st.dataframe(df_results)

        # Optional: Highlight top candidates
        top_candidates = df_results[df_results["Match Score (%)"] >= 70]
        if not top_candidates.empty:
            st.success(f"{len(top_candidates)} candidates shortlisted with score ≥ 70%!")
        else:
            st.info("No candidates matched with score ≥ 70%.")
