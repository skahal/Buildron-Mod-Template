using Buildron.Domain.Mods;

namespace JumpStartTemplate
{
    public class Mod : IMod
    {
        public void Initialize(IModContext context)
        {
			context.BuildStatusChanged += (sender, e) =>
			{
				var box = context.CreateGameObjectFromPrefab("BoxPrefab");
				var controller = box.AddComponent<BoxController>();
				controller.SetModel(e.Build);
			};
        }
    }
}