CREATE OR REPLACE FUNCTION convert_to_integer(v_input text)
RETURNS INTEGER AS $$
DECLARE v_int_value INTEGER DEFAULT NULL;
BEGIN
	BEGIN
		v_int_value := regexp_replace(v_input, '[^0-9]', '', 'g')::INTEGER;
	EXCEPTION WHEN OTHERS THEN
		RAISE NOTICE 'Invalid integer value: "%".  Returning NULL.', v_input;
		RETURN NULL;
	END;
	RETURN v_int_value;
END;
$$ LANGUAGE plpgsql;
