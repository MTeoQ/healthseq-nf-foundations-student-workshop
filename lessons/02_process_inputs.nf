nextflow.enable.dsl = 2

process SUMMARIZE_CONTEXT {
    tag "UPEC teaching case"

    input:
    path context_file

    output:
    path "upec_context_summary.txt"

    script:
    """
    # STUDENT TASK 2:
    # Create upec_context_summary.txt.
    # Copy the contents of context_file into the output file.
    echo "HealthSeq-NF teaching case summary"> upec_context_summary.txt
    cat ${context_file}> upec_context_summary.txt
    echo " Input filename: $(context_file)" >> upec_context_summary.txt
    # >> means add at the bottom
    """
}

workflow {
    context_ch = Channel.fromPath(
        "${projectDir}/upec_context.txt",
        checkIfExists: true
    )

    SUMMARIZE_CONTEXT(context_ch)
}
