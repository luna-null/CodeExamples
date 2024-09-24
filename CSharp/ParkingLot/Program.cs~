/* Make a data structure for a parking lot,
 * that sorts cars into a lot based on their
 * size.
 */

// using System.Linq;

using System.Linq;

namespace Parking
{
    public enum Size
    {
        None,
        Small,
        Medium,
        Large,
        Huge,
    }

    public class Program
    {

        public static void Main(String[] args)
        {
            Car honda = new Car("Honda", "Civic", 2001);

        }

        static ParkingLot.Lot allocateCarToLot(ParkingLot parkingArea, Car car)
        {
            car.carLot = ParkingLot.getNextAvailableSizedLot(parkingArea, car.size);

            return car.carLot;
        }
    }

    public class ParkingLot
    {

        public struct Lot
        {
            public required int? LotNumber;
            public required Size? LotSize;
        }

        public required int size;       // Number of Lots
        public required Lot[] Lots;
        public Lot[] usedLots;

        public ParkingLot(int size, Lot[] lots, Lot[] usedLots)
        {
            this.size = size;
            this.Lots = lots;
            this.usedLots = usedLots;
        }

        public static Lot getNextAvailableSizedLot(ParkingLot parkingArea, Size size)
        {
            Lot? selectLot = null;
            foreach (Lot lot in parkingArea.Lots)
            {
                if (! parkingArea.usedLots.Contains(lot) && lot.LotSize == size)
                {
                    selectLot = lot;
                    break;
                }
            }
            return (Lot)selectLot;
        }

        public static Lot getLot(ParkingLot parkingArea, int lotNum)
        {
            return parkingArea.Lots.Single(lot => lot.LotNumber == lotNum);
        }


    }

    public class Car
    {
        public required string make { get; set; }       // Number of Lots
        public required string model { get; set; }
        public required int year { get; set; }
        public Size size { get; set; }
        public ParkingLot.Lot carLot { get; set; }

        public Car()
        {
            this.size = Size.None;
            this.carLot = new ParkingLot.Lot {LotNumber = -1, LotSize = Size.None };
        }

        public Car(
            string make, 
            string model, 
            int year, 
            Size size = Size.None
            )
        {
            this.make = make;
            this.model = model;
            this.year = year;
            this.size = Size.None; // Default size
            this.carLot = new ParkingLot.Lot {LotNumber = -1, LotSize = Size.None };
        }

        public void setSize(Car car, Size sizeLevel)
        {
            car.size = sizeLevel;
        }
    }
}
