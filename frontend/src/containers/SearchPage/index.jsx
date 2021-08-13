import SearchForm from '../../components/SearchForm/index';
import ResultsTable from '../../components/ResultsTable/index';
import { Container, Row, Col, Toast, ToastBody, ToastHeader } from 'reactstrap';
import axios from 'axios';
import { useState } from 'react';

const SearchPage = () =>{
  const [vehicles, setVehicles] = useState([ ]);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState('');
  const [show, setShow] = useState(false);

  const toggle = () => setShow(!show);

  const onSearch = (e, selectedOption, text) => {
    e.preventDefault();

    setIsLoading(true)
    setShow(false)
    setError('')
    axios.get('http://localhost:3000/search',{
               params: {
                 text: text,
                 filter: selectedOption
               }
    }).then((response) => {
      setVehicles(response.data)
      setIsLoading(false)
    }).catch((error) =>{
      setError('ERROR:' + error.response);
      setShow(true);
    });
  };

  return(
    <div>
      <Toast isOpen={show} className="bg-danger">
        <ToastHeader toggle={toggle} />
        <ToastBody>
          {error}
        </ToastBody>
      </Toast>
      <Container style={{paddingTop: '10rem'}}>
        <Row style={{paddingBottom: '5rem'}}>
          <Col>
            <SearchForm
              onSearch={onSearch}
            />
          </Col>
        </Row>
        <Row>
          <Col>
            <ResultsTable vehicles={vehicles} isLoading={isLoading}/>
          </Col>
        </Row>
      </Container>
    </div>
  );
}
export default SearchPage;
