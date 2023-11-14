/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */

export function cookingStatus(status = -1) {
  switch (status) {
    case 0: return 'Lasagna is done.';
    case -1: return 'You forgot to set the timer.';
    default: return 'Not done, please wait.';
  }
}

export function preparationTime(layers, average_preparation_time = 2) {
  return layers.length * average_preparation_time;
}

export function quantities(layers) {
  let noodleCount = 0;
  let sauceCount = 0;
  for (let key in layers) {
    if (layers[key] === 'noodles') {
      noodleCount++;
    }
    if (layers[key] === 'sauce') {
      sauceCount++;
    }
  }

  return {
    noodles: noodleCount * 50,
    sauce: sauceCount * 0.2
  };
}

export function addSecretIngredient(friendsList, myList) {
  myList.push(friendsList[friendsList.length - 1]);

  return;
}

export function scaleRecipe(recipe, amount) {
  var result = {};
  for (let key in recipe) {
    result[key] = recipe[key] * (amount / 2)
  }

  return result;
}
