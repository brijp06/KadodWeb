$(document).ready(function () {
    $('#modelNo').on('input', function () {
        // Allow only numbers
        //$(this).val($(this).val().replace(/[^0-9]/g, ''));
        $(this).val($(this).val().replace(/[^0-9.]/g, '')      // Allow numbers and decimal points
            .replace(/(\..*?)\..*/g, '$1') // Allow only one decimal point
            .replace(/^(\d*\.\d{2}).*/, '$1')); // Restrict to two decimal places
    });
    $(document).on('input', '.qtyInput', function () {
        //$(this).val($(this).val().replace(/[^0-9]/g, ''));
        $(this).val($(this).val().replace(/[^0-9.]/g, '')      // Allow numbers and decimal points
            .replace(/(\..*?)\..*/g, '$1') // Allow only one decimal point
            .replace(/^(\d*\.\d{2}).*/, '$1')); // Restrict to two decimal places
    });
    function validateForm() {
        let isValid = true;

        // Validate name
        if ($('#mname').val().trim() === "") {
            isValid = false;
        }

        // Validate mobile number
        const mobileNumber = $('#mmobileno').val().trim();
        if (mobileNumber === "" || !/^\d{10}$/.test(mobileNumber)) {
            isValid = false;
        }

        // Validate village name
        if ($('#mvillagename').val().trim() === "") {
            isValid = false;
        }

        // Validate membership checkboxes
        if (!$('#yesCheckbox').is(':checked') && !$('#noCheckbox').is(':checked')) {
            isValid = false;
        }

        // Show or hide payment options based on membership selection
        if ($('#yesCheckbox').is(':checked')) {
            $('#paymentOptions').show();
            if ($('#paymentType').val() === null) {
                isValid = false;
            }
        } else {
            $('#paymentOptions').hide();
        }

        // Enable or disable the Next button
        $('#nextButton').prop('disabled', !isValid);
    }

    // Attach event listeners for validation
    $('#mname, #mmobileno, #mvillagename, #paymentType').on('input', validateForm);
    $('#yesCheckbox, #noCheckbox').on('change', validateForm);

    // Disable the Next button initially
    $('#nextButton').prop('disabled', true);
    $('#btnsave').on('click', function () {
        submitForm();
    });
    // Click event for the Add Product button
    function submitForm() {
        var formData = new FormData($('#customerForm')[0]);
        formData.append('mname', $('#mname').val());
        formData.append('Bmobileno', $('#mmobileno').val());
        formData.append('ismember', $("input[name='membership']:checked").val());
        formData.append('Mvillagename', $('#mvillagename').val());

        if ($("input[name='membership']:checked").val() === "Yes") {
            formData.append('billtype', $('#paymentType').val());
        } else {
            formData.append('billtype', 'Cash');
        }

        $.ajax({
            url: '/KhatarSale/Addsalefrom',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function (result) {
                var msg = "તમારો બીલ નંબર છે :- " + result.opmessage + "";
                Swal.fire({
                    title: "તમારો Order અમને મળી ગયો છે.",
                    text: msg,
                    icon: "success"
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = '/Home/Login';
                    }
                });
            },
            error: function (error) {
                console.error('Error:', error.responseText);
                $("#loader").hide();
            }
        });
    };

});


