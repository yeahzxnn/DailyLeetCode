SELECT
  Prices.product_id,
  IFNULL(
    ROUND(
      SUM(Prices.price * UnitsSold.units) / SUM(UnitsSold.units),
      2
    ),
    0
  ) AS average_price
FROM Prices
LEFT JOIN UnitsSold
  ON (
    Prices.product_id = UnitsSold.product_id
    AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date)
GROUP BY 1;

/*
SELECT
  Prices.product_id,  -- Select the product ID from the Prices table
  IFNULL(  -- Use IFNULL to handle cases where the average price might be NULL
    ROUND(  -- Round the calculated average price to 2 decimal places
      SUM(Prices.price * UnitsSold.units) / SUM(UnitsSold.units),  -- Calculate the average price by dividing total revenue by total units sold
      2  -- Specify the number of decimal places to round to
    ),
    0  -- If the result is NULL, return 0 instead
  ) AS average_price  -- Alias the result as average_price
FROM Prices  -- Specify the Prices table as the main table
LEFT JOIN UnitsSold  -- Perform a LEFT JOIN with the UnitsSold table
  ON (  -- Define the join condition
    Prices.product_id = UnitsSold.product_id  -- Match product IDs from both tables
    AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date  -- Ensure the purchase date is within the price validity period
  )
GROUP BY 1;  -- Group the results by the first column (product_id)

*/

/*
SELECT
  Prices.product_id,  -- Prices 테이블에서 제품 ID를 선택합니다.
  IFNULL(  -- 평균 가격이 NULL일 경우를 처리하기 위해 IFNULL을 사용합니다.
    ROUND(  -- 계산된 평균 가격을 소수점 두 자리로 반올림합니다.
      SUM(Prices.price * UnitsSold.units) / SUM(UnitsSold.units),  -- 총 수익을 총 판매 수량으로 나누어 평균 가격을 계산합니다.
      2  -- 반올림할 소수점 자리 수를 지정합니다.
    ),
    0  -- 결과가 NULL인 경우 0을 반환합니다.
  ) AS average_price  -- 결과를 average_price라는 별칭으로 지정합니다.
FROM Prices  -- Prices 테이블을 주 테이블로 지정합니다.
LEFT JOIN UnitsSold  -- UnitsSold 테이블과 LEFT JOIN을 수행합니다.
  ON (  -- 조인 조건을 정의합니다.
    Prices.product_id = UnitsSold.product_id  -- 두 테이블의 제품 ID를 일치시킵니다.
    AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date  -- 구매 날짜가 가격 유효 기간 내에 있는지 확인합니다.
  )
GROUP BY 1;  -- 결과를 첫 번째 열(제품 ID)로 그룹화합니다.
*/
