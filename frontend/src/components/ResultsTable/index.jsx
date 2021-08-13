import { Spinner, Table } from 'reactstrap';

const ResultsTable = ({vehicles, isLoading}) =>{
  return (
    <Table>
      <thead>
        <tr>
          <th>#</th>
          <th>Model</th>
          <th>Brand</th>
          <th>Year</th>
          <th>Mileage</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>
        {
          isLoading ? (
            <tr className='center'>
              <td colSpan='6' style={{height: '30rem', paddingTop: '10rem'}}>
                <Spinner color="primary" style={{ width: '3rem', height: '3rem' }} children='' />
              </td>
            </tr>
          ) : (
            vehicles.map((vehicle, index) => {
            return(
              <tr key={index}>
                <th>{vehicle.id}</th>
                <td>{vehicle.model_name}</td>
                <td>{vehicle.brand_name}</td>
                <td>{vehicle.year}</td>
                <td>{vehicle.mileage}</td>
                <td>{vehicle.price}</td>
              </tr>
            )})
          )
        }
    </tbody>
  </Table>
  )
}
export default ResultsTable;
