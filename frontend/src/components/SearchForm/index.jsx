import { Button, Form, InputGroup, InputGroupAddon, Input } from 'reactstrap';
import { useState } from 'react'

const SearchForm = ({ onSearch }) => {
  const [options] = useState([
    'select one ...',
    'model_name',
    'brand_name',
    'year',
    'mileage',
    'price'
  ]);
  const [selectedOption, setSelectedOption] = useState('')
  const [text, setText] = useState('')

  const onChangeText = (e) => {
    setText(e.target.value);
  };

  const onChangeOptionType = (e) => {
    setSelectedOption(e.target.value);
  };

  return(
    <Form >
      <InputGroup>
        <Input
          value={text}
          onChange={e => onChangeText(e)}
          type="search"
          placeholder="What are you looking for? ..."
        />

        <InputGroupAddon addonType="append">
          <Input type="select" onChange={e => onChangeOptionType(e)}>
            { options.map((value, index) => {
              return(
                <option
                key={index}
                value={value}
                >
                 {value}
                </option>
              );
            })};
          </Input>
        </InputGroupAddon>

        <InputGroupAddon addonType="append">
            <Button onClick={(e) => onSearch(e, selectedOption, text) }>Search</Button>
        </InputGroupAddon>
      </InputGroup>
    </Form>
  );
}
export default SearchForm;
