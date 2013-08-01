--
-- Name: bio_clinical_trial_design; Type: TABLE; Schema: biomart; Owner: -
--
CREATE TABLE bio_clinical_trial_design (
    ref_id character varying(4000),
    ref_record_id character varying(4000),
    ref_back_reference character varying(4000),
    ref_article_pmid character varying(4000),
    ref_protocol_id character varying(4000),
    ref_title character varying(4000),
    study_type character varying(4000),
    common_name character varying(4000),
    icd10 character varying(4000),
    mesh character varying(4000),
    disease_type character varying(4000),
    physiology_name character varying(4000),
    trial_status character varying(4000),
    trial_phase character varying(4000),
    nature_of_trial character varying(4000),
    randomization character varying(4000),
    blinded_trial character varying(4000),
    trial_type character varying(4000),
    run_n_period character varying(4000),
    treatment_period character varying(4000),
    washout_period character varying(4000),
    open_label_extension character varying(4000),
    sponsor character varying(4000),
    trial_nbr_of_patients_studied character varying(4000),
    source_type character varying(4000),
    trial_age character varying(4000),
    disease_severity character varying(4000),
    difficult_to_treat character varying(4000),
    asthma_diagnosis character varying(4000),
    inhaled_steroid_dose character varying(4000),
    laba character varying(4000),
    ocs character varying(4000),
    xolair character varying(4000),
    ltra_inhibitors character varying(4000),
    asthma_phenotype character varying(4000),
    fev1 character varying(4000),
    fev1_reversibility character varying(4000),
    tlc character varying(4000),
    fev1_fvc character varying(4000),
    fvc character varying(4000),
    dlco character varying(4000),
    sgrq character varying(4000),
    hrct character varying(4000),
    biopsy character varying(4000),
    dyspnea_on_exertion character varying(4000),
    concomitant_med character varying(4000),
    trial_smokers_pct character varying(4000),
    trial_former_smokers_pct character varying(4000),
    trial_never_smokers_pct character varying(4000),
    trial_pack_years character varying(4000),
    exclusion_criteria character varying(4000),
    minimal_symptoms character varying(4000),
    rescue_medication_use character varying(4000),
    control_details character varying(4000),
    blinding_procedure character varying(4000),
    number_of_arms character varying(4000),
    description character varying(4000),
    arm character varying(4000),
    arm_nbr_of_patients_studied character varying(4000),
    arm_classification_type character varying(4000),
    arm_classification_value character varying(4000),
    arm_asthma_duration character varying(4000),
    arm_geographic_region character varying(4000),
    arm_age character varying(4000),
    arm_gender character varying(4000),
    arm_smokers_pct character varying(4000),
    arm_former_smokers_pct character varying(4000),
    arm_never_smokers_pct character varying(4000),
    arm_pack_years character varying(4000),
    minority_participation character varying(4000),
    baseline_symptom_score character varying(4000),
    baseline_rescue_medication_use character varying(4000),
    clinical_variable character varying(4000),
    clinical_variable_pct character varying(4000),
    clinical_variable_value character varying(4000),
    prior_med_drug_name character varying(4000),
    prior_med_pct character varying(4000),
    prior_med_value character varying(4000),
    biomarker_name character varying(4000),
    biomarker_pct character varying(4000),
    biomarkervalue character varying(4000),
    cellinfo_type character varying(4000),
    cellinfo_count character varying(4000),
    cellinfo_source character varying(4000),
    pulmonary_pathology_name character varying(4000),
    pulmpath_patient_pct character varying(4000),
    pulmpath_value_unit character varying(4000),
    pulmpath_method character varying(4000),
    runin_ocs character varying(4000),
    runin_ics character varying(4000),
    runin_laba character varying(4000),
    runin_ltra character varying(4000),
    runin_corticosteroids character varying(4000),
    runin_anti_fibrotics character varying(4000),
    runin_immunosuppressive character varying(4000),
    runin_cytotoxic character varying(4000),
    runin_description character varying(4000),
    trtmt_ocs character varying(4000),
    trtmt_ics character varying(4000),
    trtmt_laba character varying(4000),
    trtmt_ltra character varying(4000),
    trtmt_corticosteroids character varying(4000),
    trtmt_anti_fibrotics character varying(4000),
    trtmt_immunosuppressive character varying(4000),
    trtmt_cytotoxic character varying(4000),
    trtmt_description character varying(4000),
    drug_inhibitor_common_name character varying(4000),
    drug_inhibitor_standard_name character varying(4000),
    drug_inhibitor_cas_id character varying(4000),
    drug_inhibitor_dose character varying(4000),
    drug_inhibitor_route_of_admin character varying(4000),
    drug_inhibitor_trtmt_regime character varying(4000),
    comparator_name character varying(4000),
    comparator_dose character varying(4000),
    comparator_time_period character varying(4000),
    comparator_route_of_admin character varying(4000),
    treatment_regime character varying(4000),
    placebo character varying(4000),
    experiment_description character varying(4000),
    primary_endpoint_type character varying(4000),
    primary_endpoint_definition character varying(4000),
    primary_endpoint_time_period character varying(4000),
    primary_endpoint_change character varying(4000),
    primary_endpoint_p_value character varying(4000),
    primary_endpoint_stat_test character varying(4000),
    secondary_type character varying(4000),
    secondary_type_definition character varying(4000),
    secondary_type_time_period character varying(4000),
    secondary_type_change character varying(4000),
    secondary_type_p_value character varying(4000),
    secondary_type_stat_test character varying(4000),
    clinical_variable_name character varying(4000),
    pct_change_from_baseline character varying(4000),
    abs_change_from_baseline character varying(4000),
    rate_of_change_from_baseline character varying(4000),
    average_over_treatment_period character varying(4000),
    within_group_changes character varying(4000),
    stat_measure_p_value character varying(4000),
    definition_of_the_event character varying(4000),
    number_of_events character varying(4000),
    event_rate character varying(4000),
    time_to_event character varying(4000),
    event_pct_reduction character varying(4000),
    event_p_value character varying(4000),
    event_description character varying(4000),
    discontinuation_rate character varying(4000),
    response_rate character varying(4000),
    downstream_signaling_effects character varying(4000),
    beneficial_effects character varying(4000),
    adverse_effects character varying(4000),
    pk_pd_parameter character varying(4000),
    pk_pd_value character varying(4000),
    effect_description character varying(4000),
    biomolecule_name character varying(4000),
    biomolecule_id character varying(4000),
    biomolecule_type character varying(4000),
    biomarker character varying(4000),
    biomarker_type character varying(4000),
    baseline_expr_pct character varying(4000),
    baseline_expr_number character varying(4000),
    baseline_expr_value_fold_mean character varying(4000),
    baseline_expr_sd character varying(4000),
    baseline_expr_sem character varying(4000),
    baseline_expr_unit character varying(4000),
    expr_after_trtmt_pct character varying(4000),
    expr_after_trtmt_number character varying(4000),
    expr_aftertrtmt_valuefold_mean character varying(4000),
    expr_after_trtmt_sd character varying(4000),
    expr_after_trtmt_sem character varying(4000),
    expr_after_trtmt_unit character varying(4000),
    expr_chg_source_type character varying(4000),
    expr_chg_technique character varying(4000),
    expr_chg_description character varying(4000),
    clinical_correlation character varying(4000),
    statistical_test character varying(4000),
    statistical_coefficient_value character varying(4000),
    statistical_test_p_value character varying(4000),
    statistical_test_description character varying(4000)
);

