public static Station metodaWytworcza(String filename) throws IOException {
    try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
        String header = br.readLine();
        if (header == null) throw new IOException("Plik pusty!");

        String[] headParts = header.split(" ");
        String stationId = headParts[0];
        int numOfSlots = Integer.parseInt(headParts[1]);

        List<Vehicle> vehicles = new ArrayList<>();

        String line;
        while ((line = br.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts[0].equalsIgnoreCase("Bicycle")) {
                vehicles.add(new Bicycles(Integer.parseInt(parts[1])));
            } else if (parts[0].equalsIgnoreCase("Scooter")) {
                vehicles.add(new Scooter(Integer.parseInt(parts[1]), Integer.parseInt(parts[2])));
            }
        }

        return new Station(numOfSlots, stationId, vehicles);
    }
}
