defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @day 24*60*60
  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds), do: seconds / (365.25*@day)
  def age_on(:mercury, seconds), do: seconds / (87.97*@day)
  def age_on(:venus, seconds), do: seconds / (224.7*@day)
  def age_on(:mars, seconds), do: seconds / (686.98*@day)
  def age_on(:jupiter, seconds), do: seconds / (4332.59*@day)
  def age_on(:saturn, seconds), do: seconds / (10759*@day)
  def age_on(:uranus, seconds), do: seconds / (30688.5*@day)
  def age_on(:neptune, seconds), do: seconds / (60182*@day)
end
