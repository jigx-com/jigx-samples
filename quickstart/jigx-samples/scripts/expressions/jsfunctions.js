export function helloWorld() {
  return 'Hello World'
}

export function getFullName(firstName, lastName) {
  return firstName + ' ' + lastName;
}

export function calculateTax(subtotal, taxRate) {
  const tax = subtotal * (taxRate / 100);
  return Math.round(tax * 100) / 100;
}

export function calculateTotal(subtotal, taxRate) {
  const tax = subtotal * (taxRate / 100);
  const total = subtotal + tax;
  console.log(subtotal);
  console.log(tax)
  return total
}

export function formatCurrency(amount, currencySymbol) {
  return currencySymbol + parseFloat(amount).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
}

export function rateDealSize(amount) {
  if (amount > 80000) {
    return 'large';
  } else if (amount >= 20000) {
    return 'medium';
  } else {
    return 'small';
  }
}

export function distanceApart(from_long, from_lat, to_long, to_lat) {
  // Function to convert degrees to radians
  function toRadians(degrees) {
      return degrees * Math.PI / 180;
  }

  // Radius of the Earth in miles
  var R = 3958.8;

  // Difference in coordinates
  var dLat = toRadians(to_lat - from_lat);
  var dLon = toRadians(to_long - from_long);

  // Current lat and long in radians
  var lat1 = toRadians(from_lat);
  var lat2 = toRadians(to_lat);

  // Haversine formula
  var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var distanceBetweenPoints = R * c;

  return distanceBetweenPoints;
}

export function daysUntil(targetDate) {
  if (!targetDate) {
    return NaN;
  }

  // Get today's date
  const today = new Date();
  const target = new Date(targetDate);

  // Set the target year to this year
  target.setFullYear(today.getFullYear());

  // If the target date has already passed this year, set it to next year
  if (target < today) {
    target.setFullYear(today.getFullYear() + 1);
  }

  // Calculate the difference in time
  const timeDifference = target - today;

  // Convert the time difference to days
  const daysDifference = Math.ceil(timeDifference / (1000 * 60 * 60 * 24));

  return daysDifference;
}

export function calculateAge(dateOfBirth) {
  if (!dateOfBirth) {
    return NaN;
  }
  // Parse the date of birth
  const dob = new Date(dateOfBirth);
  
  // Get today's date
  const today = new Date();
  
  // Calculate the difference in years
  let age = today.getFullYear() - dob.getFullYear();
  
  // Adjust the age if the birthdate hasn't occurred yet this year
  const monthDifference = today.getMonth() - dob.getMonth();
  const dayDifference = today.getDate() - dob.getDate();
  if (monthDifference < 0 || (monthDifference === 0 && dayDifference < 0)) {
    age--;
  }
  
  return age;
}

export function capitalizeJobTitle(str) {
  if (!str) {
    return '';
  }

  const exceptions = ['CEO', 'COO', 'CFO', 'CTO', 'CIO', 'CMO', 'CSO', 'CPO', 'CHRO', 'CDO'];

  return str.split(' ').map(word => {
    if (exceptions.includes(word.toUpperCase())) {
      return word.toUpperCase();
    }
    return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
  }).join(' ');
}

export function workdaysLeftInMonth(date) {
  if (!date) {
    return NaN;
  }

  const inputDate = new Date(date);
  const currentYear = inputDate.getFullYear();
  const currentMonth = inputDate.getMonth();
  
  // Get the last day of the current month
  const lastDayOfMonth = new Date(currentYear, currentMonth + 1, 0);

  let workdaysCount = 0;

  // Iterate through each day from the input date to the end of the month
  for (let day = inputDate.getDate(); day <= lastDayOfMonth.getDate(); day++) {
    const currentDate = new Date(currentYear, currentMonth, day);
    const dayOfWeek = currentDate.getDay();
    
    // Check if the current day is a weekday (Monday to Friday)
    if (dayOfWeek !== 0 && dayOfWeek !== 6) {
      workdaysCount++;
    }
  }

  return workdaysCount;
}

export function formatPhoneNumber(phoneNumber) {
  // Remove all non-digit characters
  const cleaned = ('' + phoneNumber).replace(/\D/g, '');
  
  //console.log(cleaned)
  //console.error(cleaned)
  //console.warn(cleaned)
  //console.trace(cleaned)
  //console.debug(cleaned)

  // Check if the input is of correct length
  if (cleaned.length !== 10) {
    return 'Invalid phone number';
  }

  // Format the cleaned number
  const part1 = cleaned.substring(0, 3);
  const part2 = cleaned.substring(3, 6);
  const part3 = cleaned.substring(6, 10);

  return `(${part1}) ${part2}-${part3}`;
}

import { addDays, isWeekend, format } from 'date-fns';
export function getNextBusinessDay(date) {
  let nextDay = addDays(date, 1);
  while (isWeekend(nextDay)) {
    nextDay = addDays(nextDay, 1);
  }
  return format(nextDay, 'MMMM d, yyyy');
}

export function getEmployeeInfo(employee) {
  console.log(`Name: ${employee.firstName} ${employee.lastName}`);
  return `${employee.firstName} ${employee.lastName} is a ${employee.position} and can be reached at ${employee.email}`;
}

export function calculateLoanPayment(principal, annualRatePercent, years) {
  const annualRate = annualRatePercent / 100; // Convert percentage to decimal
  const monthlyRate = annualRate / 12;
  const numberOfPayments = years * 12; // Calculate the total number of payments

  return (principal * monthlyRate) / (1 - Math.pow(1 + monthlyRate, -numberOfPayments));
}