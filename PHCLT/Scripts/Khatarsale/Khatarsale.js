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

    // Handle the Next button click
    $('#nextButton').on('click', function (e) {
        e.preventDefault();
        //alert("તમારું ડેટા માન્ય છે!");
        stepper.next(); // Move to the next step
    });

    // Handle the Previous button click
    $('#previousButton').on('click', function (e) {
        e.preventDefault();
        stepper.previous(); // Move to the previous step
    });
    // Click event for the Add Product button
    $('#addProduct').on('click', function () {
        // Get values from input fields
        var itemName = $('#productInput').val();
        var qty = $('#modelNo').val();

        // Check if inputs are not empty
        if (itemName.trim() === '') {
            alert('કૃપા કરી વસ્તુ નું નામ નાખો');
            return;
        }
        if (qty.trim() === '') {
            alert('કૃપા કરી જથ્થો નાખો');
            return;
        }
        // Create a new table row with the input values
        var newRow = `
                <tr>
                    <td style="display:none">HiddenValue</td>
                    <td>${itemName}</td>
                   <td>
                        <input type="text" class="form-control qtyInput" value="${qty}" />
                    </td>
                    <td>
                        <button class="btn btn-danger btn-sm deleteRow">Delete</button>
                    </td>
                </tr>
            `;

        // Append the new row to the table body
        $('#productTable tbody').append(newRow);

        // Clear input fields
        $('#productInput').val('');
        $('#modelNo').val('');
    });

    // Click event for the Delete button inside the table
    $(document).on('click', '.deleteRow', function () {
        // Remove the row of the clicked button
        $(this).closest('tr').remove();
    });



    $('#saveOrderButton').on('click', function () {
        var mname = $("#mname").val();
        var type = $("#saltype").val();
        var mmobileno = $("#mmobileno").val();
        var mvillagename = $('#mvillagename').val();
        var membership = $("input[name='membership']:checked").val(); // Will return "Yes" or "No"

        // Get the payment type if applicable
        if (membership = "Yes") {
            var paymentType = $('#paymentType').val(); // Will return "Cash" or "Credit"
        }
        else {
            var paymentType = "Cash"; // Will return "Cash" or "Credit"
        }
        var products = [];

        // Loop through the rows in the product table and collect the data
        $('#productTable tbody tr').each(function () {
            var itemName = $(this).find('td:eq(1)').text();  // Item name (second column)
            var qty = $(this).find('td:eq(2)').find('input').val();  // Qty (third column, editable)

            // Add the product data to the array
            products.push({
                itemName: itemName,
                qty: qty
            });
        });
        $.ajax({
            type: 'POST',
            url: '/KhatarSale/Addsale',
            data: { type: type, mname: mname, mmobileno: mmobileno, mvillagename: mvillagename, paymentType: paymentType, membership: membership, products: JSON.stringify(products) },
            success: function (result) {
                //var msg = "તમારો બીલ નંબર છે :- " + result.opmessage + "";
                //Swal.fire({
                //    title: "તમારો Order અમને મળી ગયો છે.",
                //    text: msg,
                //    icon: "success"
                //});
                var msg = "તમારો બીલ નંબર છે :- " + result.opmessage + "";
                Swal.fire({
                    title: "તમારો Order અમને મળી ગયો છે.",
                    text: msg,
                    icon: "success"
                }).then((result) => {
                    if (result.isConfirmed) {
                        //window.location.href = "/KhatarSale/Addsale"; // Replace with your target URL
                        window.location.href = '/Home/Login';
                    }
                });
            },
            error: function (error) {
                // Handle the error response
                console.log(error);
            }
        });
    });


});